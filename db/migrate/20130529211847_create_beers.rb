class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.text :description
      t.string :style
      t.string :brewery
      t.string :location
      t.string :color
      t.string :alcohol
      t.string :foam
      t.string :aroma

      t.timestamps
    end
  end
end
