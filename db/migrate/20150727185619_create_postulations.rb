class CreatePostulations < ActiveRecord::Migration
  def change
    create_table :postulations do |t|
      t.references :program, index: true, foreign_key: true
      t.string :name
      t.string :surname
      t.string :second_surname
      t.string :rut
      t.date :birthdate
      t.string :birthplace
      t.string :nationality
      t.string :phone
      t.string :mobile_phone
      t.string :message_phone
      t.string :email
      t.string :address
      t.string :commune
      t.string :city
      t.string :degree_school
      t.string :degree
      t.string :degree_country
      t.integer :degree_year
      t.string :other_degree
      t.string :other_degree_country
      t.integer :other_degree_year
      t.string :occupation
      t.string :work_address
      t.string :work_commune
      t.string :work_city
      t.string :work_phone
      t.string :work_email
      t.text :observations
      t.references :find_out, index: true, foreign_key: true
      t.references :financing, index: true, foreign_key: true
      
      t.attachment :cv
      t.attachment :picture
      t.attachment :degree_1
      t.attachment :degree_2
      t.attachment :postulation_tab
      t.attachment :inscription_receip
      t.attachment :intention_letter
      t.attachment :ci
      t.attachment :recommendation_letter_1
      t.attachment :recommendation_letter_2
      t.attachment :tesis_proposal
      t.attachment :interest_declaration
      
      t.date :folder_delivery
      t.date :interview
      t.integer :postulation_status
      t.integer :enrollment_status
      t.integer :tuition_status
      t.text :intern_observations
      
      t.timestamps null: false
    end
  end
end
