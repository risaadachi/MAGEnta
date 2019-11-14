class AddColumnToImpression < ActiveRecord::Migration[5.2]
  def change
    add_column :impressions, :impressionist_count, :integer, default: 0

    rename_column :impressions, :impressionist_count, :impressions_count
  end
end
