class TasksController < ApplicationController
  def index
		@tasks = Task.all
	end

	def show
		@task = Task.find(params[:id])
		@user = User.all
	end

	def new
		@task = Task.new
		@accounts = Account.all
		@user = User.all
	end

	def create 
		@task = Task.new(task_params)
		@task.open = DateTime.now.to_datetime
		@task.closed = ""

		if @task.save
			redirect_to :action =>'index'
		else
      @users = User.all
      @accounts = Account.all
			render :action => 'new'
		end
	end

	def task_params
		params.require(:tasks).permit(:description, :reason, :state, :account_id, :user_id, :open, :closed)
	end

	# def edit
	# 	@account = Account.find(params[:id])
	# 	@users = User.all
	# 	# @open_as_text =@task.open.strftime("%d-%m-%Y %H:%M")
	# end

	def edit
		@task = Task.find(params[:id])
		@account = Account.all
		@users = User.all
	end

	def update
		
		@task = Task.find(params[:id])
		
		p = task_param
		if p[:state] === "2"
			puts "vaihtoehto 2"
		 	p[:closed] = DateTime.now.to_datetime
		else
		 	p[:closed] = ""
		end
		puts p

		if @task.update_attributes(p)
			redirect_to :action => 'index', :id => @task
		else
			@users = User.all
			render :action => 'edit'
		end

	end

	def update_closed
		puts "update_closed"
		puts @task.state
		puts "======================"
		if @task.state === 2
			@task.closed = DateTime.now.to_datetime
		else
			@task.closed = nil
		end

		if @task.save
			render :action => 'edit'
		end

	end

	def delete
		Task.find(params[:id]).destroy
		redirect_to :action => 'index'
	end

	def task_param
		params.require(:task).permit(:description, :reason, :state, :account_id, :user_id, :open, :closed)
	end

  
end
