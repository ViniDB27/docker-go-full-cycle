FROM ubuntu

WORKDIR /app

COPY main.go .

RUN apt-get update && apt-get -y install golang-go 

CMD ["go", "run", "main.go"]