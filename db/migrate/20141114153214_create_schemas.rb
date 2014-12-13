class CreateSchemas < ActiveRecord::Migration
  def change
    create_table :schemas do |t|
      t.string :name
      t.string :changelogtable

      t.timestamps
    end
  end
end
