class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :code
      t.string :question
      t.integer :status
      t.integer :bal

      t.timestamps
    end
  end
end
