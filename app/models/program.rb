class Program < ApplicationRecord

    has_rich_text :description
    has_rich_text :synopsis
    has_rich_text :about

    
    has_many :program_users
    has_many :users , :through => :program_users
    belongs_to :organization , optional: true
    enum :category, %i[owner school firm]
    belongs_to :user

end
