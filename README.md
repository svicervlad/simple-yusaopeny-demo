# YUSAOPENY fast and simple demo app

## How to build the base docker image

docker build -t base -f base.Dockerfile .

## How to build the app with DB
docker build -t carnation .

## How to run the app
docker run --rm -p 8080:80 carnation

Go to http://localhost:8080 to see the app running
