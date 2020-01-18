class Category < ApplicationRecord
    has_attached_file :avatar
    has_many :products, dependent: :destroy
    validates :name, presence: true, length: { minimum: 3, maximum: 20}
    validates :feature, presence: true, length: { minimum: 3, maximum: 30}
    validates :model, presence: true

end
    