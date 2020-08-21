class CreateGatherings < ActiveRecord::Migration[6.0]
  def change
    create_table :gatherings do |t|
      t.integer :user_id
      t.integer :party_id
      t.boolean :rsvp

      t.timestamps
    end
  end
end
