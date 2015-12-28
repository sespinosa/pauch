class InfoRequestsAddColumnFindOutOther < ActiveRecord::Migration
  def change
    add_column :info_requests, :find_out_other, :string, after: :find_out_id
  end
end
