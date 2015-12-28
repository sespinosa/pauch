class AddColumnInfoRequestContactPhone < ActiveRecord::Migration
  def change
    add_column :info_requests, :contact_phone, :string, after: :second_surname
  end
end
