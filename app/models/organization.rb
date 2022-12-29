class Organization < ApplicationRecord

    has_rich_text :about
    has_one_attached :logo
    enum :category, %i[school firm]
    has_many :users

end
