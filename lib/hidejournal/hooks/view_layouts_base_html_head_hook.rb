module Hidejournal
  class Hooks < Redmine::Hook::ViewListener
    class ViewLayoutsBaseHtmlHeadHook < Redmine::Hook::ViewListener
      def view_layouts_base_html_head(context={})
		  content = stylesheet_link_tag('application', :plugin => 'hidejournal')
		  content += javascript_include_tag('script.js', :plugin => 'hidejournal')
      end
    end
  end
end
