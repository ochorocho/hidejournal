module Hidejournal
  class Hooks < Redmine::Hook::ViewListener
    # NOTE CREATION
    render_on :view_issues_edit_notes_bottom,
              :partial => 'hooks/hidejournal/view_issues_edit_notes_bottom'
  end
end
