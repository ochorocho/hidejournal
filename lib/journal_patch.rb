require_dependency 'journal'

module JournalPatch
  def self.included(base)
    base.send(:include, InstanceMethods)
    base.class_eval do
      unloadable # Send unloadable so it will not be unloaded in development
      alias_method_chain :split_private_notes, :patch
    end
  end

  module InstanceMethods
	  def split_private_notes_with_patch
		  # DO NOT SPLIT CHANGES!
	    true
	  end
  end
end

Journal.send(:include, JournalPatch)