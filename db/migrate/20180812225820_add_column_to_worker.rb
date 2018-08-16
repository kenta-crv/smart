class AddColumnToWorker < ActiveRecord::Migration[5.1]
  def change
    add_column :workers, :company_id, :integer
  end
end
