class Addchangelogfiletoschema < ActiveRecord::Migration
  def change
  	add_column :schemas, :changelogfile, :string
  end
end
