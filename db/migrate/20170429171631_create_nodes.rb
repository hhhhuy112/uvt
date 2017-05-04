class CreateNodes < ActiveRecord::Migration[5.0]
  def change
    create_table :nodes do |t|
      t.integer :type_node
      t.integer :attr_id
      t.integer :value_id
      t.string :parent_path
      t.integer :closest_parent_id
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :nodes, :attr_id
    add_index :nodes, :value_id
  end
end