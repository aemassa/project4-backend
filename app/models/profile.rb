class Profile < ActiveRecord::Base
  belongs_to :photographer
  belongs_to :photo
end
