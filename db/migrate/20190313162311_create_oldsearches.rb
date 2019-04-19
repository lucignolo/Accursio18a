class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :tabella
      t.string :campo
      t.string :argomento
      t.date :data
      t.integer :occorrenze

      t.timestamps
    end
  end
end
