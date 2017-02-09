class User < ApplicationRecord
	validates :name,presence:true,length:{maximum:50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email,presence:true,length:{maximum:255},format:{with:VALID_EMAIL_REGEX},uniqueness:{case_sensitive:false}
	has_secure_password
	validates :password,presence:true,length:{minimum:6}
	has_many :assigned_tickets,class_name: "Ticket",foreign_key: :assigned_to
	has_many :created_tickets,class_name: "Tickets",foreign_key: :created_by
	
	scope :get_users, ->(user_type) {select('*').where("type = ?",user_type)}
	scope :get_tickets, -> {includes(:assigned_tickets).where("type != ?","EndUser")}
end
