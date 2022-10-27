class CreateReports < ActiveRecord::Migration
  def up
    create_table :reports do |t|
      t.string :building
      t.string :area
      t.string :problemtype
      t.string :emergencylevel
      t.string :status
      #t.text :description
      #t.datetime :release_date
      # Add fields that let Rails automatically keep track
      # of when reports are added or modified:
      #t.timestamps
    end
  end

  def down
    drop_table :reports
  end
end
