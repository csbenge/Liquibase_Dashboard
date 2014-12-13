class Adddatabaseconnectionsfieldstoschema < ActiveRecord::Migration
  def change
		add_column :schemas, :database_type, :string
  	add_column :schemas, :username, :string
  	add_column :schemas, :password, :string
  end
end
