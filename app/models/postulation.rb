class Postulation < ActiveRecord::Base
  belongs_to :program
  belongs_to :financing
  
  has_and_belongs_to_many :find_outs
  
  
  has_attached_file :cv
  has_attached_file :picture
  has_attached_file :degree_1
  has_attached_file :degree_2
  has_attached_file :postulation_tab
  has_attached_file :inscription_receip
  has_attached_file :intention_letter
  has_attached_file :ci
  has_attached_file :recommendation_letter_1
  has_attached_file :recommendation_letter_2
  has_attached_file :tesis_proposal
  has_attached_file :interest_declaration
  
  do_not_validate_attachment_file_type :cv
  do_not_validate_attachment_file_type :picture
  do_not_validate_attachment_file_type :degree_1
  do_not_validate_attachment_file_type :degree_2
  do_not_validate_attachment_file_type :postulation_tab
  do_not_validate_attachment_file_type :inscription_receip
  do_not_validate_attachment_file_type :intention_letter
  do_not_validate_attachment_file_type :ci
  do_not_validate_attachment_file_type :recommendation_letter_1
  do_not_validate_attachment_file_type :recommendation_letter_2
  do_not_validate_attachment_file_type :tesis_proposal
  do_not_validate_attachment_file_type :interest_declaration
  
  
  
end
