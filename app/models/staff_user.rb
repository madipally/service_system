class StaffUser < User
	has_many :tickets, :foreign_key => "assigned_to"
end
