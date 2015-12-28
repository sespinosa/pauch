class CreateInfoRequests < ActiveRecord::Migration
  def change
    create_table :info_requests do |t|
      t.references :program, index: true, foreign_key: true
      t.string :name
      t.string :surname
      t.string :second_surname
      t.string :rut
      t.text :observations
      t.references :find_out, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
