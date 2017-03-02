# RESTapi-Golang
RESTapi project with Go programming language

<h2>Routers</h2>
* <b>GET</b> a event detail - /event/:id
* <b>GET</b> all events - /events
* <b>POST</b> new event details - /event

<h2>Steps</h2>

<b>1. Create Database and Tables</b>

Run `RESTapi_Go_Database.sql` file in MySQL database. EER Diagram of this database is shown below.

![alt tag](https://cloud.githubusercontent.com/assets/10353650/23487538/70191d5a-feef-11e6-8840-a39a911ea30d.png)

<b>2. Get all the dependencies</b>

In the `main.go` file there are 2 imports from github. To get the dependencies:

```
go get
```

<b>3. Build and Run</b>

First of all, change username, password for MySQL connection on 17th line in main.go 

```
go build main.go
main
```
![alt tag](https://cloud.githubusercontent.com/assets/10353650/23487725/abf23c5c-fef0-11e6-9fee-bebb08c5b35f.PNG)

<b>4. Test</b>

```
GET localhost:3001/events
```
![5](https://cloud.githubusercontent.com/assets/10353650/23487972/5090536a-fef2-11e6-8394-cc78a72fae68.PNG)

```
GET localhost:3001/event/5
```
![6](https://cloud.githubusercontent.com/assets/10353650/23487973/50b66bf4-fef2-11e6-80da-915139cf8794.PNG)

```
POST localhost:3001/event
```
![7](https://cloud.githubusercontent.com/assets/10353650/23487974/50ca9200-fef2-11e6-8cbd-d1bd790b5c0f.PNG)
