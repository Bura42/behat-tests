#!/bin/bash

if [ $1  = "--run" ]; then
    echo ">>>>>>>> Run Selenium container only"
    docker run -d -p 4444:4444 --name selenium selenium/standalone-chrome-debug:3.3
fi

if [ $1  = "--stop" ]; then
    echo ">>>>>>>> Stop Selenium container"
    docker container stop selenium
    docker container rm selenium
    docker container ls
fi
