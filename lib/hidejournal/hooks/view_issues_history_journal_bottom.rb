module Hidejournal
  class Hooks < Redmine::Hook::ViewListener
	# JOURNAL BUTTON
    render_on :view_issues_history_journal_bottom,
              :partial => 'hooks/hidejournal/view_issues_history_journal_bottom'

  end
end
