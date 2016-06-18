class AddQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :quote, null: false
      t.string :name, null: false
      t.string :img, null: false
    end
  end
end
