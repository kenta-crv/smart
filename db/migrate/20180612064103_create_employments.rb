class CreateEmployments < ActiveRecord::Migration[5.1]
  def change
    create_table :employments do |t|
    
        t.integer :company_id # 追加：companysテーブルと紐付け
        t.integer :user_id # 追加：usersテーブルと紐付け
        
        t.string :trial_period #試用期間
        t.string :work_start #勤務開始
        t.string :break_in #休憩開始
        t.string :break_out #休憩終了
        t.string :work_out #勤務終了
        t.string :holiday #休日
        t.string :allowance #手当
        t.string :allowance_contents #手当詳細
        t.string :closing_on #締め日
        t.string :payment_on #支払い日
        t.string :method_payment #支払方法
        t.string :desuction #控除
      t.timestamps
    end
  end
end
