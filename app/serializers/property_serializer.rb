class PropertySerializer < ActiveModel::Serializer
  attributes :property, :policy, :unit_type, :amenities

  def property
    { name: object.name }
  end

  def policy
    { pets: object.pets }
  end

  def unit_type
    object.unit_type.as_json(only: [:beds, :baths])
  end

  def amenities
    array = []
    object.amenities.each do |amenity|
      array << { name: amenity.name, type: amenity.amenity_type }
    end
    array
  end
end
