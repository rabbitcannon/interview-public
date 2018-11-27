class Event < ActiveRecord::Base
  require 'csv'
  require 'time'

  belongs_to :host

  #
  # CSV Import method.
  # params file .csv format
  #
  def self.import(file)
    CSV.foreach(file.path, headers:true) do |row|
      host_name = row['Host'].to_s
      current_host = Host.find_or_create_by(name: host_name)

      start_time = row['Date'] + " " + row['Time']
      start_datetime = DateTime.strptime(start_time, '%m/%d/%Y %H:%M:%S %p')

      duration = row['Duration'].split(":")
      end_datetime = start_datetime + duration[0].to_i.hours + duration[1].to_i.minutes + duration[2].to_i.seconds

      event_address = if row['Address'].nil? then "N/A" else row['Address'] end
      event_description = if row['Description'].nil? then "N/A" else row['Description'] end

      Event.create(
          :name => row['Title'],
          :description => event_description,
          :location => event_address,
          :starting_at => start_datetime,
          :ending_at => end_datetime,
          :host_id => current_host.id
      )
    end
  end
end
