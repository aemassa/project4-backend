class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :email
      t.string :website
      t.string :phone
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps null: false
    end
  end
end
