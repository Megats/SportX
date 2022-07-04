class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :events
  has_many :results
  has_many :collabs
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum roles: [ :moderator, :admin], _prefix: "as"
  
  

end
