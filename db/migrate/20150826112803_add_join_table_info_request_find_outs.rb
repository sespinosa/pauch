class AddJoinTableInfoRequestFindOuts < ActiveRecord::Migration
  def change
    create_join_table :info_requests, :find_outs
  end
end
