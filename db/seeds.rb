# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Folder.create(code: '200822561', docid: 1015412365, name: 'Juan', semester: 2, year: 2012)

Folder.create(code: '200822562', docid: 1015412366, name: 'Manuel', semester: 1, year: 2012)

Folder.create(code: '200822563', docid: 1015412367, name: 'Laura', semester: 2, year: 2012)

Subject.create(code: 'MATE-1', credits: 1, name: 'Materia 1', pensum_id: '1', capacity: 50,blocks: 1)

Subject.create(code: 'MATE-2', credits: 1, name: 'Materia 2', pensum_id: '1', capacity: 50, blocks: 3)

Subject.create(code: 'MATE-3', credits: 1, name: 'Materia 3', pensum_id: '1', capacity: 50, blocks: 2)

Pensum.create(year: 2008, semester: 1, magister_id: 1)

Pensum.create(year: 2009, semester: 2, magister_id: 2)

Magister.create(code: 'MISIS')

Magister.create(code: 'MATI')

Section.create(day: 2, hour: 4, pensum_id: 1, subject_id: "MATE-1", provisional: 0 )


#sub1.folders << fd1