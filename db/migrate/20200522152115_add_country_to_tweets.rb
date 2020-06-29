class AddCountryToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :country, :string
  end
end
