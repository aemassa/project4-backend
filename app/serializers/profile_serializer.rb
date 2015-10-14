class ProfileSerializer < ActiveModel::Serializer
  attributes :name, :email, :website, :phone, :city, :state, :zip, :image_url_thumb, :image_url_med, :image_url_orig, :id, :photographer

  def image_url_thumb
    object.image.url(:thumb)
  end

  def image_url_med
    object.image.url(:medium)
  end

  def image_url_orig
    object.image.url(:original)
  end

  def photographer
    object.photographer
  end

end
