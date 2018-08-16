class AddWorkerIdToAttends < ActiveRecord::Migration[5.1]
  def change
    add_column :attends, :worker_id, :integer
  end
end
