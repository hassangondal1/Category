class User < ApplicationRecord
 
 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar 
  enum :category, %i[student school firm]
  has_many :program_users
  has_many :programs , :through => :program_users
  belongs_to :organization , optional: true
  has_many :programs

end
