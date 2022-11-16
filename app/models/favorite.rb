class Favorite < ApplicationRecord
  validates :country, :recipe_link, :recipe_title, presence: true

  belongs_to :user
end
