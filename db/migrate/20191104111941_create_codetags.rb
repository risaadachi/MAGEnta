class CreateCodetags < ActiveRecord::Migration[5.2]
  def change
    create_table :codetags do |t|
      t.integer :code_id
      t.integer :tag_id

      t.timestamps
    end
    add_index :codetags, :code_id
    add_index :codetags, :tag_id
    add_index :codetags, [:code_id,:tag_id],unique: true
  end
end
