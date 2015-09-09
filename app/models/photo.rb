class Photo < ActiveRecord::Base
  has_one :profile
  has_one :photographer, through: :profiles
end
