class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.integer :tabella
      t.integer :campo
      t.string :argomento
      t.date :data
      t.integer :occorrenze
      t.integer :tipo

      t.timestamps
    end
  end
end
