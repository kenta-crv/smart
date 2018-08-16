class RemoveUserIdFromAttend < ActiveRecord::Migration[5.1]
  def change
    remove_column :attends, :user_id, :integer
  end
end
