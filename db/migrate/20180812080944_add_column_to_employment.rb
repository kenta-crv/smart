class AddColumnToEmployment < ActiveRecord::Migration[5.1]
  def change
    add_column :employments, :user_id, :integer
    add_column :employments, :company_id, :integer
  end
end
