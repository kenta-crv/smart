class AddStatusCdToWorker < ActiveRecord::Migration[5.1]
  def change
    add_column :workers, :status_cd, :integer
  end
end
