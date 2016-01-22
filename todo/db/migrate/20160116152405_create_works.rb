class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :tag
      t.text :item
      t.datetime :datetime

      t.timestamps null: false
    end
  end
end
