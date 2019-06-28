class DropExamples < ActiveRecord::Migration[5.1]
  def change
    drop_table :examples
  end
end
