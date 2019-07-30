class CreateSessionInstruments < ActiveRecord::Migration[6.0]
  def change
    create_table :session_instruments do |t|
      t.string :name
      t.references :session, null: false, foreign_key: true
      t.references :instrument, null: false, foreign_key: true

      t.timestamps
    end
  end
end
