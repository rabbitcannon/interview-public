require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "GET /events" do
    before do
      Event.create(name: "Birthday")
      Event.create(name: "Party")
    end

    it "returns a list of events" do
      get events_path
      expect(response).to have_http_status(200)
      expect(response).to render_template("events/index")
      expect(response.body).to include("Birthday")
      expect(response.body).to include("Party")
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
end
