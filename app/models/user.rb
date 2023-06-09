class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_writer :login

  has_many :messages
  has_many :chatrooms, through: :messages

  validates :user_name, :presence => true, :uniqueness => { :case_sensitive => false }

  def login
    @login || self.user_name || self.email
  end
end
