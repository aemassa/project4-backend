class ProfileSerializer < ActiveModel::Serializer
  attributes :name, :email, :website, :phone, :city, :state, :zip, :image_url_thumb, :image_url_med, :image_url_orig, :id

  def image_url_thumb
    "http://localhost:3000" + object.image.url(:thumb)
  end

  def image_url_med
    "http://localhost:3000" + object.image.url(:medium)
  end

  def image_url_orig
    "http://localhost:3000" + object.image.url(:original)
  end

end
