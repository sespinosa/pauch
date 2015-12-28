class CreateFinancings < ActiveRecord::Migration
  def change
    create_table :financings do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
