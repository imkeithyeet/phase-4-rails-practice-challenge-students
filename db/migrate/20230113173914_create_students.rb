class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :age
      t.string :major
      t.belongs_to :instructor
      t.timestamps
    end
  end
end
