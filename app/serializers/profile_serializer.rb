class ProfileSerializer < ActiveModel::Serializer
  attributes :name, :email, :website, :phone, :city, :state, :zip, :image_url, :id

  def image_url
    "http://localhost:3000" + object.image.url(:thumb)
  end

end
