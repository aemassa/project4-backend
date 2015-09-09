class AddProfileIdToPhoto < ActiveRecord::Migration
  def change
    add_reference :photos, :profile, index: true, foreign_key: true
  end
end
