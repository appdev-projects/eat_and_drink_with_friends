class CreateParties < ActiveRecord::Migration[6.0]
  def change
    create_table :parties do |t|
      t.date :date
      t.time :time
      t.text :description
      t.string :address
      t.integer :user_id

      t.timestamps
    end
  end
end
