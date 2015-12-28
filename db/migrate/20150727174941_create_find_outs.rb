class CreateFindOuts < ActiveRecord::Migration
  def change
    create_table :find_outs do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
