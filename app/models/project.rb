class Project < ApplicationRecord
  
  belongs_to :user
	belongs_to :contact
	belongs_to :account

	def phase_as_text
		case phase		
		when 2
			result = "Kontakti"
		when 3
			result = "Lähetä tarjous"
		when 4
			result = "Tarjous lähetetty"
		when 5
			result = "Tarjoukseen vastattu"
		when 6
			result = "Neuvottelu"	
		when 7
			result = "Kauppa"
		when 8
			result = "Hävitty"
		when 11
			result = "Liidi"
		when 12
			result = "Liidi suljettu"

		else
			result = " "
		end
	
		"#{result}"  
  end

  def schedule_nil_out
  	if schedule == nil 
  		result = ""
  	else
  		result = schedule.strftime("%d-%m-%Y")
  	end
  	"#{result}"
  end
  
  
end
