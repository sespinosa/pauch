class PostulationAddColumnFindOutOther < ActiveRecord::Migration
  def change
    add_column :postulations, :find_out_other, :string, after: :find_out_id
  end
end
