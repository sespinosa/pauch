class AddInternalCommentaryToPostulationsAndInfoRequest < ActiveRecord::Migration
  def change
    
    add_column :postulations, :internal_commentary, :text
    add_column :info_requests, :internal_commentary, :text
    
  end
end
