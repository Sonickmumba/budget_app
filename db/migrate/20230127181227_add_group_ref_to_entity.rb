class AddGroupRefToEntity < ActiveRecord::Migration[7.0]
  def change
    add_reference :entities, :group, null: false, foreign_key:{to_table: :groups}
  end
end
