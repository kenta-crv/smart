class AddStatusCdDefaultToWorker < ActiveRecord::Migration[5.1]
  def change
    change_column :workers, :status_cd, :integer,default: 0
  end
end
