# MongoDB Replication Documentation

This document provides essential information about MongoDB replication and outlines the steps to configure replication.

## Prerequisites for MongoDB Replication

- **Docker and Containerization**
Docker is a powerful containerization platform that facilitates the process of containerizing applications or software. Containerization involves packaging an application and its dependencies into a single unit, known as a Docker image. These images can then be run as isolated containers on various host systems, providing consistent environments and easing deployment.

- **MongoDB Basics**
	To successfully implement MongoDB replication, it's essential to have a grasp of fundamental MongoDB concepts:

	***Replication***: Replication is the process of maintaining multiple copies of data across multiple servers. In MongoDB, a replica set is a group of MongoDB servers that collectively store and replicate data. It provides redundancy, fault tolerance, and data availability.

	***Node***: Each server within a replica set is referred to as a node. Nodes can have different roles, such as primary, secondary, or arbiter.

	***Primary Node***: The primary node is the main server that handles all write operations and serves as the data source for replication.

	***Secondary Node***: Secondary nodes replicate data from the primary node and can serve read operations. They provide data redundancy and can step in as the primary node in case the primary fails.

	***Arbiter Node***: An arbiter node doesn't store data but participates in the election of a primary node. It helps to achieve an odd number of voting nodes for elections.

	By grasping these prerequisites, you'll be better prepared to configure and manage MongoDB replication effectively.

	Remember to refer to the official MongoDB documentation for comprehensive guidance on setting up and managing replication in MongoDB. Documentation Link: MongoDB Replication [Documentation](https://www.docker.com/get-started).

## MongoDB Replication

### **1. Clone this repository:**

   ```bash
   git clone https://github.com/ramazanakkulak/mongodb-replication
   ```

### **2. Start the project:**
   ```bash
   ./start.sh
   ```

### **3. Stop the project:**
   ```bash
   ./stop.sh
   ```


## Replica Set Configuration
```bash
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