# lanistatsit-backend
Backend for the lanistatsit application.

## Run migrations
```
cargo install dbmigrate
dbmigrate --url postgres://user:pass@localhost/databasename --path ./migrations up
```
