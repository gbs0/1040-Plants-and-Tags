class Tag < ApplicationRecord
    has_many :plants, through: :plant_tags
    has_many :plant_tags, dependent: :destroy
end
