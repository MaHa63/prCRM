class Task < ApplicationRecord
  
  belongs_to :account
	belongs_to :user
  
  validates :user_id, presence: { message:  "Vastuuhenkilö pakollinen tieto!" }


	def reason_as_text
		case reason
		when 1
			result = "Soitto"
		when 2
			result = "Email"
		when 3
			result = "Palaveri"
		else
			result = " "
		end

		"#{result}"  
  end

  def state_as_text
		case state
		when 1
			result = "Auki"
		when 2
			result = "Hoidettu"
		else
			result = " "
		end
	
		"#{result}"  
  end

  def open_as_text
  	result = open.strftime("%d-%m-%Y %H:%M")
  	"#{result}"
  end

  def closed_nil_out
  	if closed == nil 
  		result = ""
  	else
  		result = closed.strftime("%d-%m-%Y %H:%M")
  	end
  	"#{result}"
  end

  
end
