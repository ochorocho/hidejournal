class HideController < ApplicationController
	unloadable
	
	def index
		
		@journalHide = Journal.find(params[:journal])
		@issue = Issue.find(@journalHide.journalized_id)

		if User.current.allowed_to?(:view_private_notes, @issue.project)
			if !params[:journal].nil?
				if @journalHide.private_notes?
					@journalAjax = ['status' => 'success', 'changed_to' => 'false']
					
					@journalHide.private_notes = '0'
					@journalHide.save
				else
					@journalAjax = ['status' => 'success', 'changed_to' => 'true']
	
					@journalHide.private_notes = '1'
					@journalHide.save
				end				
			else
				@journalAjax = ['status' => 'error']
			end 
	
			render json: @journalAjax
		else
			@journalAjax = ['status' => 'error', 'permission' => 'false']
			render json: @journalAjax
		end
	end
end
