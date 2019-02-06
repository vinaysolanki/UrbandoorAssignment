require 'rails_helper'

RSpec.describe "Properties API" do
  describe "Index action" do
    before do
      @property = Property.create(name: '500 Sansome St.', pets: true)
      @unit_type = UnitType.create(beds: 1, baths: 1, property: @property)
      @pool_amenity = Amenity.create(name: "Pool", amenity_type: "pool", property: @property)
      @parking_amenity = Amenity.create(name: "Parking", amenity_type: "parking", property: @property)
      @bbq_amenity = Amenity.create(name: "BBQ", amenity_type: "bbq", property: @property)
    end

    it "returns list of properties with name and policy" do
      get properties_url
      resp = JSON.parse(response.body)

      prop = resp[0]
      expect(prop["property"]["name"]).to eql("500 Sansome St.")
      expect(prop["policy"]["pets"]).to eql(true)
    end

    it "returns unit type for each property" do
      get properties_url
      resp = JSON.parse(response.body)

      prop = resp[0]
      expect(prop["unit_type"]["beds"]).to eql(1)
      expect(prop["unit_type"]["baths"]).to eql(1)
    end

    it "returns amenities for each property" do
      get properties_url
      resp = JSON.parse(response.body)
      amenities = resp[0]["amenities"]

      expect(amenities[0]["name"]).to eql("Pool")
      expect(amenities[0]["type"]).to eql("pool")
      expect(amenities[1]["name"]).to eql("Parking")
      expect(amenities[1]["type"]).to eql("parking")
    end

    it "filters property by number of beds" do
      property_with_2_beds = Property.create(name: "456 Fourth Blvd", pets: true)
      UnitType.create(beds: 2, baths: 2, property: property_with_2_beds)

      get properties_url, params: { beds: 1 }

      resp = JSON.parse(response.body)

      expect(resp.count).to eql(1)
      expect(resp[0]["property"]["name"]).to eql("500 Sansome St.")
    end
  end
end