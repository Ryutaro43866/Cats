class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.references :customer, foreign_key: true
      t.string :title
      t.text :introduction

      t.timestamps
    end
  end
end
