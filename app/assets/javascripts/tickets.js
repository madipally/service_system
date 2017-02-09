var selected_ticket_ids = new Array();
$(document).ready(function()
{
	$("#tickets_container").on('click',".check_ticket",function()
	{
	   if($(this).prop('checked'))
	   {
			selected_ticket_ids.push($(this).val());
	   }
	   else
	   {
			selected_ticket_ids.splice($.inArray($(this).val(),selected_ticket_ids),1);
	   }
	});
		
	$("#tickets_container").on('click',".checkall_tickets",function()
	{
			$(".check_ticket").prop('checked', $(this).prop("checked"));
			if($(this).prop("checked"))
			{
				$(".check_ticket").each(function()
				{
					selected_ticket_ids.push($(this).val());
				});
			}
			else
			{
				selected_ticket_ids = []
			}
	});
	
	$("#tickets_container").on('change','.update_ticket_status',function()
	{
		if(selected_ticket_ids.length >0)
		{
			var confirm = window.confirm("Are you sure want to update the ticket(s) status?")
			ticket_update_status = $(this).val()
			if(confirm && ticket_update_status)
			{
				$("#tickets_container").html('Loading ...');
				$.ajax({
					url:$(this).attr('ajax_path'),
					type: "POST",
					data:{ticket_ids:selected_ticket_ids,update_status:ticket_update_status},
					success: function(data){
					}
				});
			}
		}
		else
		{
			alert("please select atleast one ticket")
		}
	});
	$("#tickets_container").on('change','.cls_assign_ticket_user',function()
	{
	  if(selected_ticket_ids.length >0)
	  {
		var confirm = window.confirm("Are you sure want to assign the ticket(s)?")
		ticket_assignee = $(this).val();
		if(confirm && ticket_assignee)
		{
			$("#tickets_container").html("Loading..");
			$.ajax({
			  url:$(this).attr('ajax_path'),
			  type:"POST",
			  data:{ticket_ids:selected_ticket_ids,assignee:ticket_assignee},
			  success: function(data) {}
			});
		}
	  }
	});
});

	