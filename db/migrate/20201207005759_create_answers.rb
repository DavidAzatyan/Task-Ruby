class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.integer :fCODE
      t.string :fANSWER
      t.string :fTRUEFALSE
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
