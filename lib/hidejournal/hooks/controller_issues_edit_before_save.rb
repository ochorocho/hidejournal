module Hidejournal
  class Hooks < Redmine::Hook::ViewListener
     def controller_issues_edit_after_save(context={})
		params = context[:params]
		setprivate = params[:issue_settoprivate]

		if !setprivate.nil?
			if params[:last_journal_id].to_i 
				id = params[:last_journal_id].to_i + 1
				journal = Journal.find(id)
			else
				journal = issue.init_journal(User.current, params[:notes])
			end

			journal.private_notes = '1'
			journal.save				
		end
	end
  end
end



# module Hidejournal
#   class Hooks < Redmine::Hook::ViewListener
#     def controller_issues_edit_after_save(context={})
#     	#safe_attributes 'settoprivate'
#     
# 		journal = context[:journal]
# 		params = context[:params]
# 		journal.private_notes = params[:set_to_private_fields]
# 		journal.save
# 		
# 	end
#   end
# end
