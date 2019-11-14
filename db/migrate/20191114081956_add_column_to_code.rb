class AddColumnToCode < ActiveRecord::Migration[5.2]
  def change
    add_column :codes, :impressions_count, :integer
  end
end
