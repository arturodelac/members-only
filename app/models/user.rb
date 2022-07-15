class User < ApplicationRecord
  has_many :posts
  has_many :comments
  def email_required?
    false
 end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
