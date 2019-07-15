class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.string :name
      t.string :modules
      t.integer :user_id

      t.timestamps
    end
  end
end
