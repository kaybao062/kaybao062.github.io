class AddImageToJournals < ActiveRecord::Migration[7.0]
  def change
    add_column :journals, :image, :string
  end
end
