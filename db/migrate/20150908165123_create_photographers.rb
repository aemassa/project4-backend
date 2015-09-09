class CreatePhotographers < ActiveRecord::Migration
  def change
    create_table :photographers do |t|
      t.string :email, null: false, index: { unique: true }
      t.string :password_digest, null: false
      t.string :token, null: false

      t.timestamps null: false, index: { unique: true }
    end
  end
end
