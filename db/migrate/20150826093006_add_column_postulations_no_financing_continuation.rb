class AddColumnPostulationsNoFinancingContinuation < ActiveRecord::Migration
  def change
    add_column :postulations, :no_continuation, :boolean, after: :financing_id
  end
end
