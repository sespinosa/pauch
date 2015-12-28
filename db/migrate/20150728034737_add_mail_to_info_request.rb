class AddMailToInfoRequest < ActiveRecord::Migration
  def change
    add_column :info_requests, :email, :string
  end
end
