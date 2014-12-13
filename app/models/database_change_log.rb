class DatabaseChangeLog < ActiveRecord::Base

  self.table_name   =  "databasechangelog"
  self.primary_key  = "ID"
  
end
