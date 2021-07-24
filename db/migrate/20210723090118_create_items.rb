class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item_name,          null: false
      t.text       :description,        null: false
      t.integer    :category_id,        null: false
      t.integer    :status_id,          null: false
      t.integer    :charge_id,          null: false 
      t.integer    :prefecture_id,      null: false 
      t.integer    :shippingDate_id,    null: false 
      t.integer    :price,              null: false
      t.references :user,               null: false, foreign_key: true 
      t.timestamps
    end
  end
end