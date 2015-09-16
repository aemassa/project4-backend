# Add to json of PhotographerSerializer
class LoginPhotographerSerializer < PhotographerSerializer
  attributes :token

  has_one :profile

end
