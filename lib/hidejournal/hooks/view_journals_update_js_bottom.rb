module Hidejournal
  class Hooks < Redmine::Hook::ViewListener
	# JS SAVE NOTE
    render_on :view_journals_update_js_bottom,
              :partial => 'hooks/hidejournal/view_journals_update_js_bottom'
  end
end
