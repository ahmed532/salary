# README

Run bundle install
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
  
* Endpoint `payment/summary` lists all upcoming months details
* Endpoint `payment/month_details/:num` accepts any month_number `in (1..12)`
* Endpoints `staffs/` for Staff `CRUD` work as you would expect
* Endpoints `departments/` for Department `CRUD` work as you would expect



