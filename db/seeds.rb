# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Folder.create(code: '200822561', docid: 1015412365, name: 'clase1', semester: 2, year: 2012)

Folder.create(code: '200822562', docid: 1015412366, name: 'clase2', semester: 2, year: 2012)

Folder.create(code: '200822563', docid: 1015412367, name: 'clase3', semester: 2, year: 2012)

Subject.create(code: 'MICODIGO1', credits: 1, name: 'NOMBRE1')

Subject.create(code: 'MICODIGO2', credits: 1, name: 'NOMBRE2')

Subject.create(code: 'MICODIGO3', credits: 1, name: 'NOMBRE3')

#fd1.subjects << sub1

#fd1.subjects << sub2

#fd2.subjects << sub2

#fd2.subjects << sub3

#fd3.subjects << sub1

#sub1.folders << fd1