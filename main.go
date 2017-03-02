package main

import (
	"bytes"
	"database/sql"
	"fmt"
	"net/http"
	"time"
	"math/rand"
	"github.com/gin-gonic/gin"
	_ "github.com/go-sql-driver/mysql"
)



func main() {
	db, err := sql.Open("mysql", "<USERNAME>:<PASSWORD>@/user_events")
	fmt.Print(db);
	if err != nil {
		fmt.Print("Can not connect to database, please control your username, password and database name\n")
	}
	defer db.Close()
	// make sure connection is available
	err = db.Ping()
	if err != nil {
		fmt.Print("Can not send ping to database, connection is lost\n")
	}
	type Event struct {
		Id         		int
		UserID	   		int
		ApiKey	   		string
		TimeStamp  		string
	}
	router := gin.Default()

	// GET a event detail
	router.GET("/event/:id", func(c *gin.Context) {
		start := time.Now()
		
		var (
			event Event
			result gin.H
		)
		id := c.Param("id")
		row := db.QueryRow("select eventid, userid, apikey, timestamp from events where eventid = ?;", id)
		err = row.Scan(&event.Id, &event.UserID, &event.ApiKey, &event.TimeStamp)
		if err != nil {
			// If no results send null
			result = gin.H{
				"result": nil,
				"count":  0,
			}
		} else {
			result = gin.H{
				"result": event,
				"count":  1,
			}
		}
		
		c.JSON(http.StatusOK, result)
		end := time.Now()
		latency := end.Sub(start)
		insertToLatencyTable(latency, db, "GET")
		
	})

		// GET all events
	router.GET("/events", func(c *gin.Context) {
		start := time.Now()
		var (
			event  Event
			events []Event
		)
		rows, err := db.Query("select * from events;")
		if err != nil {
			fmt.Print("Please control your SQL statement\n")
		}
		for rows.Next() {
			err = rows.Scan(&event.Id, &event.UserID, &event.ApiKey, &event.TimeStamp)
			events = append(events, event)
			if err != nil {
				fmt.Print(err.Error())
			}
		}
		defer rows.Close()
		c.JSON(http.StatusOK, gin.H{
			"result": events,
			"count":  len(events),
		})
		end := time.Now()
		latency := end.Sub(start)

		insertToLatencyTable(latency, db, "GET")

	})

	// POST new event details
	router.POST("/event", func(c *gin.Context) {
		start := time.Now()
		var buffer bytes.Buffer
		userid := c.PostForm("userid")
		apikey := c.PostForm("apikey")
		timestamp := c.PostForm("timestamp")
		stmt, err := db.Prepare("insert into events (userid, apikey, timestamp) values(?,?,?);")
		if err != nil {
			fmt.Print("Please control your SQL statement\n")
		}
		_, err = stmt.Exec(userid, apikey, timestamp)

		if err != nil {
			fmt.Print("Please control your post form datas\n")
		} else {
			// Fastest way to append strings
			buffer.WriteString(userid)
			buffer.WriteString(" ")
			buffer.WriteString(apikey)
			buffer.WriteString(" ")
			buffer.WriteString(timestamp)
			defer stmt.Close()
			name := buffer.String()

			//Sleep randomly 0-100 ms before storing event
			rand.Seed(time.Now().Unix())
			fmt.Print(rand.Intn(100))
			time.Sleep(time.Duration(rand.Intn(100)) * time.Millisecond)
			end := time.Now()
			latency := end.Sub(start)

			insertToLatencyTable(latency, db, "POST")
			c.JSON(http.StatusOK, gin.H{
				"message": fmt.Sprintf(" %s successfully created", name),
			})
				
		}
		
	})


	//Runs on this port
	router.Run(":3001")
}


func bucketOfResponseTime(latency time.Duration) (x int) {
	one, err := time.ParseDuration("1ms")
	if err != nil {
		fmt.Print(err.Error())
	}
	five, err := time.ParseDuration("5ms")
	if err != nil {
		fmt.Print(err.Error())
	}
	ten, err := time.ParseDuration("10ms")
	if err != nil {
		fmt.Print(err.Error())
	}
	twenty, err := time.ParseDuration("20ms")
	if err != nil {
		fmt.Print(err.Error())
	}
	fifty, err := time.ParseDuration("50ms")
	if err != nil {
		fmt.Print(err.Error())
	}

	if latency < one{
		x = 1
	} else if latency < five{
		x = 5
	}else if latency < ten{
		x = 10
	}else if latency < twenty{
		x = 20
	}else if latency < fifty{
		x = 50
	}else{
		x = 100
	}
	return
}

func insertToLatencyTable(latency time.Duration, db *sql.DB, requestType string ){
	stmt, err := db.Prepare("insert into latency (type, response) values(?,?);")
		if err != nil {
			fmt.Print("Please control your SQL statement\n")
		}
		_, err = stmt.Exec(requestType, bucketOfResponseTime(latency))

		if err != nil {
			fmt.Print("Can not execute the SQL statement\n")
		}
}
