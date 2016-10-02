class AddProjectIdToKeywords < ActiveRecord::Migration
  def change
    add_column :keywords, :project_id, :integer, required: true
  end
end
