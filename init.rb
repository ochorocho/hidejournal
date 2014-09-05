require 'redmine'

# Patches to the Redmine core. Will not work in development mode
require_dependency 'journal_patch'

Redmine::Plugin.register :hidejournal do
  name 'Hidejournal plugin'
  author 'Jochen Roth'
  description 'Enable to hide each single journal entry. New ones hidden by default'
  version '0.0.1'
  url 'http://dokuwiki.knallimall.org/redmine/hidejournal/'
  author_url 'http://dokuwiki.knallimall.org/'

  project_module :issue_tracking do
    permission(:view_private_note, {})
    permission(:add_private_note, {})
  end
end

# VIEW HOOKS
require 'hidejournal/hooks/view_layouts_base_html_head_hook' # CSS + JS LOADING - REQUIRED
require 'hidejournal/hooks/view_issues_edit_notes_bottom' # CHECK Private notes by Default
require 'hidejournal/hooks/view_issues_history_journal_bottom' # SHOW BULP ICON