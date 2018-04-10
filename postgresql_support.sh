#!/bin/bash

# Read the logs
cat /usr/local/var/postgres/server.log

# View running processes
ps auxwww | grep postgres

# Start Postgresql
pg_ctl -D /usr/local/var/postgres -l logfile start

# Stop Postgresql
pg_ctl -D /usr/local/var/postgres -l logfile stop

# -----------------------------------------------
# "FATAL:  role "postgres" does not exist"
/usr/local/Cellar/postgresql/<version>/bin/createuser -s postgres
