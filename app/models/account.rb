class Account < ApplicationRecord
  belongs_to :user
	has_many :tasks
	has_many :contacts
	has_many :projects
	validates_presence_of :name
end
