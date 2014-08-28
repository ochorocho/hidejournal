module Hidejournal
  class Hooks < Redmine::Hook::ViewListener
    # BUTTON FOR NOTE CREATION
    render_on :view_journals_notes_form_after_notes,
              :partial => 'hooks/hidejournal/view_journals_notes_form_after_notes'

  end
end
