class CreateShorturls < ActiveRecord::Migration[5.1]
  def change
    create_table :shorturls do |t|
      t.string :token

      t.timestamps
    end
  end
end
