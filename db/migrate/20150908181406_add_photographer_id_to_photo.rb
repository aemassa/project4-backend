class AddPhotographerIdToPhoto < ActiveRecord::Migration
  def change
    add_reference :photos, :photographer, index: true, foreign_key: true
  end
end
