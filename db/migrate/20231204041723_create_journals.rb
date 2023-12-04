class CreateJournals < ActiveRecord::Migration[7.0]
  def change
    create_table :journals do |t|
      t.text :content
      t.text :title
      t.string :mood
      t.string :weather
      t.date :date
      t.integer :author_id

      t.timestamps
    end
  end
end
