class CreateParties < ActiveRecord::Migration[6.0]
  def change
    create_table :parties do |t|
      t.date :date
      t.time :time
      t.text :description

      t.timestamps
    end
  end
end
