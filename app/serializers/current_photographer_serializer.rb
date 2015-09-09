# Add to json of PhotographerSerializer
class CurrentPhotographerSerializer < PhotographerSerializer
  attributes :details

  def details
    'Details you only get if this is the current_photographer' if current_photographer
  end
end
