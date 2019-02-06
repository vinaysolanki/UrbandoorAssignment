class PropertySerializer < ActiveModel::Serializer
  attributes :property, :policy

  def property
    { name: object.name }
  end

  def policy
    { pets: object.pets }
  end
end
