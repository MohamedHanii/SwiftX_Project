
# SwitftX_Project

## Functionality requirements

- Authentication: Create account / login / logout.
- When logged in, a user can view, edit and delete entered `jogging times`.
- Implement three roles with different permission levels: a regular user would only be able to CRUD on their owned records, a user manager would be able to CRUD users, and an admin would be able to CRUD all records and users.
- Each time entry when entered has a date, distance, and time.
- Filter by dates from-to.
- Report on average speed & distance per week.


## Routes

Here are the available routes in our application and also you can find postman collection for it:

### Sessions
- `POST '/login'` - Create a session (login) for a user.
```
curl -X POST -d "username=admin&password=admin" http://localhost:3000/login
```

- `DELETE '/logout'` - Destroy the session (logout) for the current user.
```
curl -X DELETE http://localhost:3000/logout
```


### Jogging Times
- `GET '/jogging_times/weekly_report'` - Generate a weekly report on average time and distance for jogging times.
```
curl -X GET http://localhost:3000/jogging_times/weekly_report
```

- `GET '/jogging_times'` - Display a list of jogging times for current user.
```
curl -X GET http://localhost:3000/jogging_times
```
- `POST '/jogging_times'` - Create a new jogging time for current user.
```
curl -X POST -d "time=30&distance=5.5" http://localhost:3000/jogging_times
```
- `GET '/jogging_times/:id'` - Generate a weekly report on average time and distance for jogging times.
```
curl -X GET http://localhost:3000/jogging_times/:id
```
- `PUT '/jogging_times/:id'` - Update details of a jogging time.
```
curl -X PATCH -d "time=35" http://localhost:3000/jogging_times/:id
```
- `DELETE '/jogging_times/:id'` - Delete a specific jogging time.
```
curl -X DELETE http://localhost:3000/jogging_times/:id
```

### Users
- `GET '/users'` - Display a list of users.
```
curl -X GET http://localhost:3000/users
```

- `POST '/users'` - Create a new user.
```
curl -X POST -d "username=username&password=securepassword&role_id=2" http://localhost:3000/users
```
- `GET '/users/:id'` - Display details of a specific user.
```
curl -X GET http://localhost:3000/users/:id
```
- `PATCH/PUT '/users/:id'` - Update details of a specific user.
```
curl -X PATCH -d "username=username2&role_id=1" http://localhost:3000/users/:id
```
- `DELETE '/users/:id'` - Delete a specific user.

```
curl -X DELETE http://localhost:3000/users/:id
```

### Jogging Times (Nested under Users)
- `GET '/users/:id/jogging_times'` - Display jogging times for a specific user.

```
curl -X GET http://localhost:3000/users/:id/jogging_times
```
- `POST '/users/:id/jogging_times'` - Create a new jogging time for a specific user.
```
curl -X POST -d "time=30&distance=5.5" http://localhost:3000/users/:id/jogging_times

```

The routes follow conventional naming and are designed to interact with the corresponding controllers and actions in our Ruby on Rails application.
