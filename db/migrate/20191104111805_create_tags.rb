class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.text :tagname

      t.timestamps
    end
    add_index :tags, :tagname, unique: true
  end
end
