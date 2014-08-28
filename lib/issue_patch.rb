require_dependency 'issue'

module IssuePatch
  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods)

    base.class_eval do
#       alias_method :save_attachments_without_enhance, :save_attachments unless method_defined?(:save_attachments_without_enhance)
#       alias_method :save_attachments, :save_attachments_with_enhance
      #alias_method :split_private_notes_without_enhance, :split_private_notes unless method_defined?(:split_private_notes_without_enhance)
      alias_method :split_private_notes, :split_private_notes_with_enhance

    end
  end

  module InstanceMethods
#	  before_create :split_private_notes_with_enhance

#     def save_attachments_with_enhance(attachments, author=User.current)
#       attach_result = save_attachments_without_enhance(attachments, author)
# 
#       if attach_result[:files].length > 0
#         attach_result[:files].each do |file|
#           file.container = self
#         end
#         Mailer.deliver_attachments_added(attach_result[:files])
#       end
#     end
	  def split_private_notes_with_enhance
	    if private_notes?
	      if notes.present?
	        if details.any?
	          # Split the journal (notes/changes) so we don't have half-private journals
	          journal = Journal.new(:journalized => journalized, :user => user, :notes => nil, :private_notes => true)
	          journal.details = details
	          journal.private_notes = '1'
	          journal.save
	          self.details = []
	          self.created_on = journal.created_on
	        end
	      else
	        # Blank notes should not be private
	        self.private_notes = true
	      end
	    end
	    true
	  end




  end

end