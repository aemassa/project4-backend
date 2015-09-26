class PhotoSerializer < ActiveModel::Serializer
  attributes :caption, :gallery_image_url_thumb, :gallery_image_url_med, :id, :profile, :photographer

  def gallery_image_url_thumb
    "http://localhost:3000" + object.gallery_image.url(:thumb)
  end

  def gallery_image_url_med
    "http://localhost:3000" + object.gallery_image.url(:medium)
  end

  def profile
    object.profile
  end

  def photographer
    object.profile.photographer
  end

end
