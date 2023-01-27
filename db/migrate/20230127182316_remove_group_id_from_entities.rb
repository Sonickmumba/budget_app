class RemoveGroupIdFromEntities < ActiveRecord::Migration[7.0]
  def change
    remove_column :entities, :group_id, :integer
  end
end
