#encoding: utf-8
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name        , limit: 150
      t.string :email       , limit: 50
      t.string :password_encript
      t.string :key

      t.timestamps
    end
  end
end
