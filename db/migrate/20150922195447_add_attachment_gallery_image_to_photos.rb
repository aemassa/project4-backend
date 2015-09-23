class AddAttachmentGalleryImageToPhotos < ActiveRecord::Migration
  def self.up
    change_table :photos do |t|
      t.attachment :gallery_image
    end
  end

  def self.down
    remove_attachment :photos, :gallery_image
  end
end
