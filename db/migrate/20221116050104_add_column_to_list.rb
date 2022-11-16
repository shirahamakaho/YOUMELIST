class AddColumnToList < ActiveRecord::Migration[6.1]
  def change
    add_column :lists, :memo, :text
  end
end
