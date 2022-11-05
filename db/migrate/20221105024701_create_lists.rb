class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      t.references :user,foregin_key: true
      t.references :dream,foregin_key: true
      t.timestamps
    end
  end
end
