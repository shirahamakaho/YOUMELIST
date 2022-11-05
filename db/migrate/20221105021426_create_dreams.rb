class CreateDreams < ActiveRecord::Migration[6.1]
  def change
    create_table :dreams do |t|
      t.string :things,null: false
      t.timestamps
    end
  end
end
