require 'redmine'

Redmine::Plugin.register :hidejournal do
  name 'Hidejournal plugin'
  author 'Jochen Roth'
  description 'Enable to hide each and every single journal entry. New ones hidden by default'
  version '0.0.1'
  url 'http://dokuwiki.knallimall.org/redmine/hidejournal/'
  author_url 'http://example.com/about'

  project_module :issue_tracking do
    permission(:view_private_note, {})
    permission(:add_private_note, {})
  end
end

### HOOK EM UP!
# VIEW HOOKS
require 'hidejournal/hooks/view_layouts_base_html_head_hook'

require 'hidejournal/hooks/view_issues_edit_notes_bottom'
require 'hidejournal/hooks/view_issues_form_details_bottom'
require 'hidejournal/hooks/view_issues_history_journal_bottom'
require 'hidejournal/hooks/view_journals_notes_form_after_notes'
require 'hidejournal/hooks/view_journals_update_js_bottom'

# CONTROLLER HOOKS
require 'hidejournal/hooks/controller_journals_edit_post'
require 'hidejournal/hooks/controller_issues_edit_before_save'

require 'issue_patch'

	Issue.send(:include, IssuePatch)
# unless Version.included_modules.include? RedmineVersionFields::VersionPatch
# 	Version.send(:include, RedmineVersionFields::VersionPatch)
# end
# unless Query.included_modules.include? RedmineVersionFields::QueryPatch
# 	Query.send(:include, RedmineVersionFields::QueryPatch)
# end