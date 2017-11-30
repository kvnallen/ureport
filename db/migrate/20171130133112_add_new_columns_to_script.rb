class AddNewColumnsToScript < ActiveRecord::Migration[5.0]
  def change
    change_table :scripts do |t|
      t.column :name, :string, limit: 100, null: false, default: 'NoName'
      t.column :description, :text
    end
  end
end
