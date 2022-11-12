class AddDescriptionToReports < ActiveRecord::Migration
  def change
    add_column :reports, :description, :text
    add_column :reports, :file, :string
  end
end
