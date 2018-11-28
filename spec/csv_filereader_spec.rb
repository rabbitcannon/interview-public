require "rails_helper"
require "csv"


describe "POST /events", type: :request do
  csv_rows = CSV.generate do |csv|
    csv << %w["Title","Description","Date","Time","Duration","Address","City","State","Host"]
    csv << [
        "Taco Party",
        "Where we will eat the tacos together.",
        "03/10/2019",
        "2:00pm",
        "4:00",
        "1422 Cedar Park",
        "Simcity",
        "TN",
        "Robert Blahut"
    ]
    csv << [
        "Taco Party 2",
        "Where we will eat the tacos together again.",
        "03/10/2019",
        "1:13pm",
        "4:00",
        "1422 Cedar Park",
        "Simcity",
        "TN",
        "Robert Blahut"
    ]
   end

   file = Tempfile.new("events.csv")
   file.write(csv_rows)
   file.rewind

   it "imports a csv of events" do
     post "/events", import_file: Rack::Test::UploadedFile.new(file, "text/csv")
     expect(Event.where(:title, "Taco Party")).to be_truthy
     expect(Event.where(:title, "Taco Party 2")).to be_truthy
   end
 end
