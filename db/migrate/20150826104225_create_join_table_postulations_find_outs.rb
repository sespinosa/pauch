class CreateJoinTablePostulationsFindOuts < ActiveRecord::Migration
  def change
    create_join_table :postulations, :find_outs
  end
end
