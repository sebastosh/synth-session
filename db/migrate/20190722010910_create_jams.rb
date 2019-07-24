class CreateJams < ActiveRecord::Migration[5.1]
  def change
    create_table :jams do |t|
      t.string :name

      t.timestamps
    end
  end
end
