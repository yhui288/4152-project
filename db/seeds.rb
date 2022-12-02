# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# 

reports = [
	{:building => 'Butler',:area => 'Restroom 4th FL', :problemtype=> 'Plumbing', :emergencylevel => 'Urgent', :status => 'Uncompleted', :uni => 'yp2604'},
	{:building => 'Pupin',:area => 'Lab1034', :problemtype=> 'Electronic', :emergencylevel => 'Urgent', :status => 'Uncompleted', :uni => 'yp2604'},
	{:building => 'Wien',:area => 'Room 523', :problemtype=> 'Heat', :emergencylevel => 'Ordinary', :status => 'Uncompleted', :uni => 'yp2604'},
	{:building => 'Uris',:area => 'Class Room 301', :problemtype=> 'CVN', :emergencylevel => 'Ordinary', :status => 'Uncompleted', :uni => 'yp2604'},
	{:building => 'Butler',:area => 'Computer 52', :problemtype=> 'Internet', :emergencylevel => 'Ordinary', :status => 'Uncompleted', :uni => 'yp2604'},
]

reports.each do |report|
	Report.create!(report)
end