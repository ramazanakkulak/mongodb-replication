#!/bin/bash
function timer(){
    hour=0
    min=0
    sec=3
        while [ $hour -ge 0 ]; do
                 while [ $min -ge 0 ]; do
                         while [ $sec -ge 0 ]; do
                                 echo -ne "$hour:$min:$sec\033[0K\r"
                                 let "sec=sec-1"
                                 sleep 1
                         done
                         sec=59
                         let "min=min-1"
                 done
                 min=59
                 let "hour=hour-1"
         done
}

function upDocker(){
    sudo docker-compose up -d
}

function setReplica(){
    sudo docker exec mongo1 /scripts/init.sh
}

function start(){
    echo "Installing the MongoDB Replication Set..."
    upDocker
    while true
    do
        mongo1="$(docker inspect --format={{.State.Health.Status}} mongo1)"
        echo Mongo 1 Status: $mongo1

        mongo2="$(docker inspect --format={{.State.Health.Status}} mongo2)"
        echo Mongo 2 Status: $mongo2

        mongo3="$(docker inspect --format={{.State.Health.Status}} mongo3)"
        echo Mongo 3 Status: $mongo3
        echo "Please Waiting..."
        sleep 3
        if [ $mongo1 == "healthy" ] && [ $mongo2 == "healthy" ] && [ $mongo3 == "healthy" ]; then
            echo  All MongoDB Status: healthy
            setReplica
            break
        else
            echo "Wait for the health status of the databases to be healthy."
            echo Please wait...
        fi
    done
}

start