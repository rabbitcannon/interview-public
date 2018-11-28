require 'rails_helper'

RSpec.describe "Events", type: :request do

  #
  # Modified to accommodate host name in view.
  describe "GET /events" do
    before do
      Host.create(name: "Unknown")
      Event.create(name: "Birthday", host_id: 1)
      Event.create(name: "Party", host_id: 1)
    end

    it "returns a list of events" do
      get events_path
      expect(response).to have_http_status(200)
      expect(response).to render_template("events/index")
      expect(response.body).to include("Birthday")
      expect(response.body).to include("Party")
      expect(response.body).to include("Unknown")
    end
  end

  describe "POST /events" do
    let(:data) do
      {
        event: {
          name: "BBQ"
        }
      }
    end

    it "creates an event" do
      post events_path, data
      expect(response).to have_http_status(302)

      event = Event.first
      expect(response).to redirect_to(event_path(event))
      expect(event.name).to eq("BBQ")
    end
  end

  describe "DELETE /events/:id" do
    let(:event) { Event.create(name: "Birthday") }
    let!(:event_id) { event.id }

    it "deletes the event" do
      delete event_path event
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(events_path)
      expect(Event.find_by_id(event_id)).to be_nil
    end
  end

  describe "PATCH /events/:id" do
    let!(:event) { Event.create(name: "Barbeque") }

    let(:data) do
      {
        event: {
          name: "Barbecue"
        }
      }
    end

    it "updates the event" do
      patch event_path(event), data
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(event_path(event))
      expect(event.reload.name).to eq("Barbecue")
    end
  end

  describe "GET /events/:id" do
    let(:event) { Event.create(name: "Foo") }

    it "returns a list of events" do
      get event_path(event)
      expect(response).to have_http_status(200)
      expect(response).to render_template("events/show")
      expect(response.body).to include("Foo")
    end
  end

  #
  # Events by host
  describe "/host/:id/events", type: :routing do
      it "routes /host/:id/events to events#get_events_by_host" do
        expect(:get => "/host/1/events").to route_to(
        :controller => "events",
        :action => "get_events_by_host",
        :host => "1"
      )
      end

      it "does not expose a host" do
        expect(:get => "/host").not_to be_routable
      end
  end
end
