class CreateGoods < ActiveRecord::Migration[6.0]
  def change
    create_table :goods do |t|
      t.integer :user_id
      t.integer :tweet_id

      t.timestamps
    end
  end
end
