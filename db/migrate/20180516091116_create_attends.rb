class CreateAttends < ActiveRecord::Migration[5.1]
  def change
    create_table :attends do |t|
      t.belongs_to :user, foreign_key: true
      t.datetime :start_at
      t.datetime :end_at
      t.datetime :rest_start_at
      t.datetime :rest_end_at

      t.timestamps
    end
  end
end