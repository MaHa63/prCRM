class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :accounts
  has_many :tasks
  has_many :projects

  validates :password, presence: { message:  "Ei voi olla tyhjä" }


  # validate :data_failures

  # def data_failures
  # 	unless User.exists?(first_name: first_name, last_name: last_name, encrypted_password: encrypted_password)
  #     errors.add(:base, :data_failures)
  #   end
  # end

  def whole_name
    "#{first_name} #{last_name}"
  end
  
end
