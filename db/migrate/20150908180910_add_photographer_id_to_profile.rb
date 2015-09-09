class AddPhotographerIdToProfile < ActiveRecord::Migration
  def change
    add_reference :profiles, :photographer, index: true, foreign_key: true
  end
end
