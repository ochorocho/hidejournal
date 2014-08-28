module Hidejournal
  class Hooks < Redmine::Hook::ViewListener
     def controller_journals_edit_post(context={})
		journal = context[:journal]
		params = context[:params]
		setprivate = params[:settoprivate]

		if !setprivate.nil?
			journal.private_notes.freeze
			journal.private_notes = '1'
			journal.save			
		else
			journal.private_notes.freeze
			journal.private_notes = '0'
			journal.save
		end
	end
  end
end
