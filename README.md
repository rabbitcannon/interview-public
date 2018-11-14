# interview-project

## Requirements
- Ruby version 2.3.0

## Setup
It is recommended to use [Docker Desktop](https://www.docker.com/products/docker-desktop) to develop this project so that you're running in a clean environment and don't have to worry about the overhead of fully configuring your own machine. Everything has been tested to work without issues in Docker, and these instructions assume that's what you'll be using.

1. Fork this repo from your personal github account
2. Download and install [Docker Desktop](https://www.docker.com/products/docker-desktop)
3. Clone the repo locally on your computer (the following commands are executed in the cloned `interview-project/` directory)
4. `$ git pull origin master`
5. `$ docker-compose build`
6. `$ docker-compose run web rake db:setup`

## Running the server
- `$ docker-compose up`
- You should now be able to preview the app in your browser at 127.0.0.1:3000

## Running the tests
-  `$ docker-compose run web rspec`

## Running other commands

All kinds of standard Rails development commands can be run simply by prefixing them with `docker-compose run web`. Example:
- `$ docker-compose run web rake routes`

You can also open a bash session inside the docker container like this:
- `$ docker-compose run web bash`

## Project requirements
- Need to be able to import all event data from sample csv
  - file location: `data/events.csv`
- Need to be able to view events by host
- There should be test coverage for these new features.

## Submitting the project
- Create a pull request to the [original repository](https://github.com/PartCycleTech/interview-project)
