class DashboardsController < ApplicationController
	before_action :set_internal_database

	def index
	end

	 private
   
   def set_internal_database
      ActiveRecord::Base.establish_connection(
        :adapter  => "sqlite3",
        :database => "db/lbview_#{Rails.env}.sqlite3"
      )
    end
end
