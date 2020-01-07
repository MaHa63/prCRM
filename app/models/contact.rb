class Contact < ApplicationRecord
  
  belongs_to :account
	has_many :projects
	

	def whole_name
    "#{first_name} #{last_name}"
  end
  
end
