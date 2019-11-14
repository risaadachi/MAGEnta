class RenameImpressionistCountColumnToImpressions < ActiveRecord::Migration[5.2]
  def change
  	    rename_column :impressions, :impressionist_count, :impressions_count
  end
end
