class Photo < ActiveRecord::Base
  belongs_to :profile

    has_attached_file :gallery_image,
    :styles => { :medium => "300x300>", :thumb => "100x100>" }
    # validates_attachment :gallery_image, presence: true, content_type: {content_type: /\Aimage\/.*\Z/}
      validates_attachment_content_type :gallery_image, :content_type => /\Aimage\/.*\Z/

end
