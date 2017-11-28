class Script < ApplicationRecord
  
	def self.safe_sql (command, params)
		self.sanitize_sql_array([command, params]) 
	end

end
