class ContactsController < ApplicationController
  before_action :authenticate_user!

	

	def contact_param
		params.require(:contact).permit( :first_name, :last_name, :position, :email, :phone_nbr, :status, :account_id, :opportunity_id, :lead_id)
	end

	def index
		@contacts = Contact.all
	end

	def index_by_account
		@accounts = Account.all
		@contacts = Contact.where("account_id = ?", params[:account_id])
		puts '----------------'
		puts @contacts
		puts '´---------------'
	end

	def show
		@contact = Contact.find(params[:id])
	end


	def new
		@contact = Contact.new

		@accounts = Account.all
	
	end

	

	def create
		@contact = Contact.new(contact_params)
		@contact.status = 0
		# ei voimassa @contact.opportunity_id = 0
		@contact.lead_id = 0
		#
		if @contact.save
			redirect_to :action =>'index'
		else
			@accounts = Account.all
			render :action => 'new'
		end
	end


	def contact_params
		params.require(:contacts).permit( :first_name, :last_name, :position, :email, :phone_nbr, :status, :account_id, :opportunity_id, :lead_id)
	end

	def edit
		puts params[:id]
		puts ":id"
		@contact = Contact.find(params[:id])
		puts '---------------------------------------------------'
		puts "@contact"
		puts '---------------------------------------------------'
		@accounts = User.all
	end


	def update
		
		@contact = Contact.find(params[:id])

		if @contact.update_attributes(contact_param)
			redirect_to :action => 'index'
		else
			@accounts = Account.all
			render :action => 'edit'
		end

	end

	def delete
		Contact.find(params[:id]).destroy
		redirect_to :action => 'index'
	end

end
