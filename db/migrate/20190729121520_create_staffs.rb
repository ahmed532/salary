class CreateStaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :email
      t.decimal :base_salary
      t.decimal :monthly_bonus
      t.references :department, foreign_key: true
      t.string :password_digest

      t.timestamps
    end
  end
end
