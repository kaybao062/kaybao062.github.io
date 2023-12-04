class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :cnet_id
      t.string :name
      t.string :password
      t.date :enroll_date
      t.date :graduate_date

      t.timestamps
    end
  end
end
