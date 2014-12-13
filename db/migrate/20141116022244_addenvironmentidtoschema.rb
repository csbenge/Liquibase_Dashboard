class Addenvironmentidtoschema < ActiveRecord::Migration
  def change
    add_column :schemas, :environment_id, :integer
  end
end
