class ProjectsController < ApplicationController
  def index
  	@projects = Project.all
  end

  def leads
  	@projects = Project.where("phase > 10", params[:phase])
  end

  def opportunities
  	@projects = Project.where("phase < 10", params[:phase])
  end

  def new
		@project = Project.new
		@accounts = Account.all
		@users = User.all
		@contacts = Contact.all
	end

	def create 
		@project = Project.new(project_params)

		if @project.save
			redirect_to :action =>'index'
		else
			@projects = Project.all
			render :action => 'new'
		end
	end

	def edit
		@project = Project.find(params[:id])
		@users = User.all
		@accounts = Account.all
		@contacts = Contact.all
	end

	def update
		
		@project = Project.find(params[:id])
		@users = User.all
		@accounts = Account.all
		@contacts = Contact.all

		if @project.update_attributes(project_param)
			if @project.phase > 10 
				redirect_to :action => 'leads', :id => @project
			else
				redirect_to :action => 'opportunities', :id => @project
			end
		else
			render :action => 'edit'
		end

	end

	def delete
		Project.find(params[:id]).destroy
		redirect_to :action => 'index'
	end

	def project_param
		params.require(:project).permit(:name, :description, :phase, :target_sales, :realized_sales, :schedule, :user_id, :account_id, :user_id, :contact_id, :lead_id)
	end

	def project_params
		params.require(:projects).permit(:name, :description, :phase, :target_sales, :realized_sales, :schedule, :user_id, :account_id, :user_id, :contact_id, :lead_id)
	end

  
end
