# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Folder.create(code: '200822561', docid: 1015412365, name: 'Juan', semester: 1, year: 2008, magisterName: 'MISIS',pensum_id: 1)

Folder.create(code: '200822562', docid: 1015412366, name: 'Manuel', semester: 2, year: 2009,magisterName: 'MATI',pensum_id: 2)

Folder.create(code: '200822563', docid: 1015412367, name: 'Laura', semester: 1, year: 2012, magisterName: 'MISIS',pensum_id: 3)

Pensum.create(year: 2008, semester: 1, magister_id: 1)

Pensum.create(year: 2009, semester: 2, magister_id: 2 )

Pensum.create(year: 2012, semester: 1, magister_id: 1 )

Magister.create(code: 'MISIS')

Magister.create(code: 'MATI')

Section.create(day: 2, hour: 4, pensum_id: 1, subject_id: "MATE-1", provisional: 0 )

for i in ["1", "2", "3", "4","5", "6", "7", "8","9", "10", "11", "12"] 
  	Subject.create(code: 'MATE-' + i, credits: 3, name: 'Materia ' + i , pensum_id: '1', capacity: 50,blocks: 1)
	
	Preinscription.create(subject_id: i, enrolled: 30, pensum_id: 1)
end 
