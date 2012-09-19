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

Subject.create(code: 'MATE-1', credits: 1, name: 'Materia 1')

Subject.create(code: 'MATE-2', credits: 1, name: 'Materia 2')

Subject.create(code: 'MATE-3', credits: 1, name: 'Materia 3')

#fd1.subjects << sub1

#fd1.subjects << sub2

#fd2.subjects << sub2

#fd2.subjects << sub3

#fd3.subjects << sub1

#sub1.folders << fd1