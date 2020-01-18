class AddImageAttachmentToProducts < ActiveRecord::Migration[5.0]
  def change
    change_table :products do |t|
      t.attachment :picture
    end
  end
end
