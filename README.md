# NodeJS and Express Docker project template
This is a template project for NodeJS and Express Docker applications.

Clone this repository as "base project" to get started developing your NodeJS and Express based application.

## Development
NodeJS and Express code and source files are located in the [src](./src/) directory of this project.
Development of your NodeJS and Express application and components should be placed here. 


## Getting Started

### Docker
```bash
# To build and start your Node and Express Docker project with `docker`:
$ docker build -t nodejs-express-app .
$ docker run -p 8080:8080 nodejs-express-app

# To stop your running `Docker` container instance:
$ docker ps
CONTAINER ID   IMAGE                COMMAND                  CREATED         STATUS         PORTS                                       NAMES
e58e8f830c8d   nodejs-express-app   "docker-entrypoint.s…"   8 minutes ago   Up 8 minutes   0.0.0.0:8080->8080/tcp, :::8080->8080/tcp   priceless_feistel

$ docker stop e58e8f830c8d
```

### Docker Compose
```bash
# To build and start your Node and Express Docker project with `docker-compose`:
$ docker-compose up --build

# To stop your running `docker-compose` deployment:
$ docker-compose down
```
