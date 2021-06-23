class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.references :user, null: false, foreign_key:true
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.timestamps
    end
  end
end
