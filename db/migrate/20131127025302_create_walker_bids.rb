class CreateWalkerBids < ActiveRecord::Migration
  def change
    create_table :walker_bids do |t|
      t.integer :walker_id
      t.integer :bid_id
      t.integer :activities_id
      t.timestamps
    end
  end
end
