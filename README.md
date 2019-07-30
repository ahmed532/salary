# README
## Setup
```bash
$ cd salary
$ bandle install
$ bin/rake db:setup
```

Ruby version is in .ruby-version file.<br />
The app uses ActionMailer to send emails,
  and whenever crontab to schedule them.<br/>
  Make sure you have a mail setup on your machine.<br/>
  Change from variable if you need a real test

```bash
  (crontab sends messages by mail to /var/mail/<usr>)
```


## To start mailing services
```bash
$ cd salary
$ whenever --update-crontab
```

make sure crontab got it by

```bash
$ crontab -l
```

## To Consume API

1. You need to get a token by sending a request to the `"<host>:port/authenticate"`
2. The request expects an email and a password<br/>
3. The api will respond with `"auth_token"`
4. which needs to be included in all subsequent requests under Header `"Authorization"`

### Example
```bash
$ curl -H "Content-Type: application/json" -X POST -d '{"email":"example@mail.com","password":"password"}' http://localhost:3000/authenticate
-> {"auth_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE0NjA2NTgxODZ9.xsSwcPC22IR71OBv6bU_OGCSyfE89DvEzWfDU0iybMA"}
$ curl http://localhost:3000/items
-> {"error":"Not Authorized"}
$ curl -H "Authorization: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE0NjA2NTgxODZ9.xsSwcPC22IR71OBv6bU_OGCSyfE89DvEzWfDU0iybMA" http://localhost:3000/payment/summary
-> [{month:'July', ...}, {month: 'August', ...}, ...]
$ curl -H "Authorization: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE0NjA2NTgxODZ9.xsSwcPC22IR71OBv6bU_OGCSyfE89DvEzWfDU0iybMA" http://localhost:3000/payment/month_details/7
-> {month: 'July', ...}
```
  
* Endpoint `payment/summary` lists all upcoming months details
* Endpoint `payment/month_details/:num` accepts any month_number `in (1..12)`
* Endpoints `staffs/` for Staff `CRUD` work as you would expect
* Endpoints `departments/` for Department `CRUD` work as you would expect



