# interview-project

## Requirements
- Ruby version 2.3.0

## Setup
It is recommended to use [Cloud9](https://c9.io/) to develop this project so that you're running in a clean environment and don't have to worry about the overhead of configuring your own machine. Everything has been tested to work without issues in Cloud9, and these instructions assume that's what you'll be using.

1. Fork this repo from your personal github account
2. Go to [c9.io](https://c9.io/) and create an account.
3. Create a new workspace with this configuration:
  - Hosted workspace
  - Clone from git: (clone url for your fork of this repo)
  - Ruby/Rails template
4. `$ bundle install`
5. `$ rake db:setup`

## Running the server
- `$ rails server -b $IP -p $PORT`
- Cloud9 provides a nice preview. If you start rails using the exact command above, the app will be running on your Cloud9 workspace's url. (For example my workspace url was https://partcycle-interview-project-tyleryasaka.c9users.io/.)

## Running the tests
-  `$ rspec`

## Project requirements
- Need to be able to import all event data from sample csv
  - file location: `data/events.csv`
- Need to be able to view events by host
- There should be test coverage for these new features.

## Submitting the project
- Create a pull request to the [original repository](https://github.com/PartCycleTech/interview-project)
