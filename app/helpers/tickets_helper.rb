module TicketsHelper
 def ticket_status_text
	{ :open => 1,:closed => 0,:inprogress =>2,:reopen =>3}
 end
end
