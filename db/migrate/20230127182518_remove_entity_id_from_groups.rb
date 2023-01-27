class RemoveEntityIdFromGroups < ActiveRecord::Migration[7.0]
  def change
    remove_column :groups, :entity_id, :integer
  end
end
