class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.integer :client_id
      t.string :rate
      t.date :date
      t.time :time
      t.string :status
      t.integer :bid_id
      t.timestamps
    end
  end
end
