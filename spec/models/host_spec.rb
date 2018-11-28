require 'rails_helper'

RSpec.describe Host, type: :model do
    it "is valid with valid attributes" do
      expect(Host.new(name: "Robert Blahut")).to be_valid
    end

    it "is valid with a name" do
      host = Host.new(name: "Robert Blahut")
      expect(host).to be_valid
    end

    it "is not valid without a name" do
      host = Host.new(name: nil)
      expect(host).to_not be_valid
    end

end
