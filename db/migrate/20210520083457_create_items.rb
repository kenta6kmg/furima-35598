class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :title,                null: false
      t.text        :item_description,     null: false
      t.integer     :item_category_id,     null: false
      t.integer     :item_condition_id,    null: false
      t.integer     :shipping_charge_id,   null: false
      t.integer     :shipping_area_id,     null: false
      t.integer     :day_id,               null: false
      t.integer     :price,                null: false
      t.references  :user, forgin_key: true

      t.timestamps
    end
  end
end