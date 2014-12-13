class ApplicationController < ActionController::Base

	rescue_from ActiveRecord::NoDatabaseError, :with => :database_not_found

	def database_not_found
		set_internal_database
		respond_to do |format|
			flash[:error] = 'Could not connect to Schema.'
			format.html { redirect_to schemas_url }
		end
	end

	def set_Schema_Connection(schema)
		begin
		  ActiveRecord::Base.establish_connection(
		    :adapter  => "#{schema.database_type}",
		    :host     => "#{schema.host}",
		    :port     => "#{schema.port}",
		    :username => "#{schema.username}",
		    :password => "#{schema.password}",
		    :database => "#{schema.name}"
		    )
	  	return 0
    rescue
      set_internal_database
      return 1
    end
	end
	
end