class Script < ApplicationRecord
	
	validates_presence_of :command, :name
	validates_uniqueness_of :name, case_sensitive: false
	
	def self.safe_sql (command, params)
		send(:sanitize_sql_array, [command, params]) 
	end

	def all_params	
		 self.command.scan(/(:.\w+)/).map {|s| s.first.gsub ':', '' }
	end
end
