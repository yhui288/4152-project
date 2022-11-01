# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# 

reports = [
	{:building => 'Butler',:area => 'Restroom 4th FL', :problemtype=> 'Plumbing', :emergencylevel => 'Emergent', :status => 'Uncomplete'},
	  {:building => 'Pupin',:area => 'Lab1034', :problemtype=> 'Electronic', :emergencylevel => 'Emergent', :status => 'Uncomplete'},
	  {:building => 'Wien',:area => 'Room 523', :problemtype=> 'Heat', :emergencylevel => 'Ordinary', :status => 'Uncomplete'},
	  {:building => 'Uris',:area => 'Class Room 301', :problemtype=> 'CVN', :emergencylevel => 'Ordinary', :status => 'Uncomplete'},
	  {:building => 'Butler',:area => 'Computer 52', :problemtype=> 'Internet', :emergencylevel => 'Ordinary', :status => 'Uncomplete'},
	  ]

reports.each do |report|
	Report.create!(report)
end