#!/bin/bash

# PostgreSQL
brew install postgres
mkdir -p $HOME/Library/LaunchAgents
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew/mxcl.postgresql.plist

# Have issues? Some help with PostgreSQL:
#  http://stackoverflow.com/questions/7975414/how-to-check-status-of-postgresql-server-mac-os-x
#  http://stackoverflow.com/questions/7975556/how-to-start-postgresql-server-on-mac-os-x
#  https://chartio.com/resources/tutorials/how-to-start-postgresql-server-on-mac-os-x/

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
