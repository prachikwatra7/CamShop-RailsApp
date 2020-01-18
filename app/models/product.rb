class Product < ApplicationRecord
  belongs_to :category
  
    validates :name, presence: true, length: { minimum: 3, maximum: 50}
    validates :description, presence: true, length: { minimum: 10, maximum: 300}
    validates :price, presence: true
    validates :make, presence: true, length: { minimum: 4, maximum: 4}
    
    has_attached_file :picture, styles: { large: "1200x620>", medium: "500x300#", small: "200x200#", thumb: "80x50#" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end
