class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :name
      t.integer :teams

      t.timestamps null: false
    end
  end
end
