class TicketsController < ApplicationController
  def index
	@tickets_per_page = 2
	page_no = params[:page] || 1
	if current_user.type != "AdminUser" && current_user.type != "StaffUser"
		@tickets = Ticket.get_user_tickets(session[:user_id]).page(page_no).per(@tickets_per_page)
	elsif current_user.type == "AdminUser"
		@tickets = Ticket.all.page(page_no).per(@tickets_per_page)
		@users_with_tickets = User.get_tickets.map{|user| ["#{user.name}(#{user.assigned_tickets.size})",user.id]}
	elsif current_user.type == "StaffUser"
		@tickets = Ticket.get_assigned_tickets(session[:user_id]).page(page_no).per(@tickets_per_page)
		#@users_with_tickets = User.get_tickets.map{|user| ["#{user.name}(#{user.assigned_tickets.size})",user.id]}		
	end
	#console
  end
  
  def new
	@ticket = Ticket.new
  end
  
   def create
	@ticket = Ticket.new(tickets_params)
	if @ticket.save
		flash[:success] = "Ticket created successfully"
		redirect_to tickets_path
	else
	  render 'new'
	end
  end

  def edit
	@ticket = Ticket.find(params[:id])
  end

  def destroy
  
  end
  
  def update_ticket
	#converting params to hash in order to do bulk update like [1 => {:status => 0},2 => {:status => 0}]
	tickets_hash = Hash[params[:ticket_ids].map {|k| [k,{:status => params[:update_status]}]}]
	tickets_update_status = Ticket.update_ticket(tickets_hash)
	redirect_to :action => :index
  end
  
  def update_assignee
	 tickets_hash = Hash[params[:ticket_ids].map {|ticket| [ticket,{:assigned_to => params[:assignee]}]}]
	 puts "$$$$!!"
	 p tickets_hash.inspect
	 tickets_update_status = Ticket.update_ticket(tickets_hash)
	 redirect_to :action => :index
	 console
  end
  
  private
	def tickets_params
		params.require(:ticket).permit(:title,:description,:priority,:created_by)
	end
end
