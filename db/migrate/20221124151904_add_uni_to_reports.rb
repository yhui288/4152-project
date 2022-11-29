class AddUniToReports < ActiveRecord::Migration
  def change
    add_column :reports, :uni, :string
  end
end
