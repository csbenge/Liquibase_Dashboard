class Addporttoschema < ActiveRecord::Migration
  def change
  	add_column :schemas, :port, :string
  end
end
