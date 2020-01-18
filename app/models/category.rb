class Category < ApplicationRecord
    has_attached_file :avatar, styles: { large: "1200x620>", medium: "500x300#", small: "200x200#", thumb: "80x50#" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
    has_many :products, dependent: :destroy
    validates :name, presence: true, length: { minimum: 3, maximum: 20}
    validates :feature, presence: true, length: { minimum: 3, maximum: 30}
    validates :model, presence: true

end
    