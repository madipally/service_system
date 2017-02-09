class Ticket < ApplicationRecord
	validates :title,presence:true,length:{maximum:15}
	validates :description,presence:true,length:{maximum:500}
	validates :priority,presence:true
	belongs_to :assigned_user,class_name:"User",foreign_key: :assigned_to
	belongs_to :created_user,class_name:"User",foreign_key: :created_by
	
	scope :get_user_tickets, ->(user_id) {select('*').where("created_by =?",user_id)}
    scope :get_assigned_tickets, ->(user_id) { select('*').where(assigned_to: user_id) }
	
	def self.update_ticket(tickets)
		if Ticket.update(tickets.keys,tickets.values)
		  return true
		else
		  return false
		end
	end
end
