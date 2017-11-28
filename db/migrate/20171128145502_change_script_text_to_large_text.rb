class ChangeScriptTextToLargeText < ActiveRecord::Migration[5.0]
  def change
    remove_column :scripts, :command
    add_column :scripts, :command, :text
  end
end
