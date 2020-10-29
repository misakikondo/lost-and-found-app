class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :items_name,     null: false
      t.string :persons_name,   null: false
      t.string :places,         null: false
      t.text   :memos,          null: false
      t.datetime   :found_date,     null: false
      t.timestamps
    end
  end
end
