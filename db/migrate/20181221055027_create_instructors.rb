class CreateInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :instructors do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.integer :salary
      t.string :education
      t.string :email
      t.string :password
      t.integer :cohort_id

      t.timestamps
    end
    add_index :instructors, :email, unique: true
  end
end
