# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Event.count == 0
  Event.create([
    {
       name: "Jimmy's Birthday Party",
       description: "Jimmy is turning twelve! Help us celebrate",
       location: "The Park",
       starting_at: 48.hours.from_now,
       ending_at: 50.hours.from_now
    },
    {
       name: "Sally's Birthday Party",
       description: "Sally is turning ten! Help us celebrate",
       location: "Sally's House",
       starting_at: 24.hours.from_now,
       ending_at: 27.hours.from_now
    }
  ])
end

if Host.count == 0
  Host.create([
      {
          name: "Unknown"
      }
  ])
end