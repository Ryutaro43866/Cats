class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|

      t.integer :folower_id
      t.integer :folowed_id

      t.timestamps
    end
  end
end
