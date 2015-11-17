# Vet EMR Database

This is a simple database containing 3 tables.

`animals`
`notes`
`todos`

`animals` have many `notes` and many `todos`

`notes` have one `animal`

`todos` have either an `animal` or a `note`

## Setup

You can load the data into Sqlite3 and launch an interactive prompt with the following command:

`sqlite3 --init schema.sql `
