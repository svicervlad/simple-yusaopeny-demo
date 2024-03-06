docker build -t base -f base.Dockerfile .
docker build -t carnation .
docker run --rm -p 8080:80 carnation
