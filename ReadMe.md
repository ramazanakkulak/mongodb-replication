# Usage

### Replication Documantation

[Links] https://www.mongodb.com/docs/manual/replication/

###Starting the project

`./start.sh`

###Stopping the project

`./stop.sh`

####Replica Set Configuration
```
    {
				"_id": "dbrs",
				"version": 1,
				"members": [
					{
						"_id": 0,
						"host": "mongo1:27017",
						"priority": 1
					},
					{
						"_id": 1,
						"host": "mongo2:27017",
						"priority":2
					},
					{
						"_id": 2,
						"host": "mongo3:27017",
						"priority": 3
					}
				]
      }
```