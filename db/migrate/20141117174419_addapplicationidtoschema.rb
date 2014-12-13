class Addapplicationidtoschema < ActiveRecord::Migration
  def change
  	add_column :schemas, :application_id, :integer
  end
end
