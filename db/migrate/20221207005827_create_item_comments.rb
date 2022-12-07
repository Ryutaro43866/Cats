class CreateItemComments < ActiveRecord::Migration[6.1]
  def change
    create_table :item_comments do |t|

      t.references :customer, foreign_key: true
      t.references :item, foreign_key: true
      t.text :comment

      t.timestamps
    end
  end
end
