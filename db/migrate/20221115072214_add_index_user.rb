class AddIndexUser < ActiveRecord::Migration[6.1]
  def change
    add_column :lists, :is_achieved, :boolean, default: false, null: false
  end
end
