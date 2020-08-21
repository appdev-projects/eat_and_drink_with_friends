class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :description
      t.integer :party_id
      t.integer :user_id

      t.timestamps
    end
  end
end
