class Profile < ActiveRecord::Base
  belongs_to :photographer
  has_many :photos

    has_attached_file :image,
    :styles => { :medium => "300x300>", :thumb => "100x100>" }
    validates_attachment :image, presence: true, content_type: {content_type: /\Aimage\/.*\Z/}

end
