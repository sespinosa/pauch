class AddColumnProgramCode < ActiveRecord::Migration
  def change
    add_column :programs, :code, :string, :after => :name
  end
end
