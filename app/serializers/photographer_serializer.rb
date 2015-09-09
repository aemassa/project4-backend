class PhotographerSerializer < ActiveModel::Serializer
  attributes :id, :email, :current_photographer

  def current_photographer
    scope == object
  end
end
