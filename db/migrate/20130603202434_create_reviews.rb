class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user, index: true
      t.references :beer, index: true
      t.integer :point

      t.timestamps
    end

    add_index :reviews, [:user_id, :beer_id], :unique  => true
  end
end
