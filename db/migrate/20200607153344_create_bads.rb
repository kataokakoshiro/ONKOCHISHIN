class CreateBads < ActiveRecord::Migration[6.0]
  def change
    create_table :bads do |t|
      t.integer :user_id
      t.integer :tweet_id

      t.timestamps
    end
  end
end
