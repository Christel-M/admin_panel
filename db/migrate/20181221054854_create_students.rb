class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :education
      t.string :email
      t.string :password

      t.timestamps
    end
    add_index :students, :email, unique: true
  end
end
