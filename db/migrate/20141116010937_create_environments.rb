class CreateEnvironments < ActiveRecord::Migration
  def change
    create_table :environments do |t|
      t.string :name
      t.string :description
      t.references :application, index: true

      t.timestamps
    end
  end
end
