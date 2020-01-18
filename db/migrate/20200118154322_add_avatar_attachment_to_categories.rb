class AddAvatarAttachmentToCategories < ActiveRecord::Migration[5.0]
  def change
    change_table :categories do |t|
      t.attachment :avatar
    end
  end
end
