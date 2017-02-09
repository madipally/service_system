class AdminUser < User
	has_many:tickets,foreign_key: :assigned_to
end
