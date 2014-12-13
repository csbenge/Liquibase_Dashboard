class Addhosttoschema < ActiveRecord::Migration
  def change
  	add_column :schemas, :host, :string
  end
end
