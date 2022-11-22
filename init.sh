#!/bin/bash
docker-compose up -d --build
sleep 20

curl --silent http://localhost:8088/books/?search=arthur%20conan%20doyle
