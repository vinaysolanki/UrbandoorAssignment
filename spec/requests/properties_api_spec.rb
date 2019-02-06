require 'rails_helper'

RSpec.describe "Properties API" do

  describe "Index action" do
    before do
      @property = Property.create(name: '500 Sansome St.', pets: true)
    end

    it "returns list of properties with name and policy" do
      get properties_url
      resp = JSON.parse(response.body)

      prop = resp[0]
      expect(prop["property"]["name"]).to eql("500 Sansome St.")
      expect(prop["policy"]["pets"]).to eql(true)
    end

    it "returns unit type for each property"
    it "returns amenities for each property"
    it "filters property by number of beds"
  end
end