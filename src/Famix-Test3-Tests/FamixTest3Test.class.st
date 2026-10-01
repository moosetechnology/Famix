Class {
	#name : 'FamixTest3Test',
	#superclass : 'FamixAbstractExportTestCase',
	#instVars : [
		'school',
		'classroom1',
		'classroom2',
		'cafeteria',
		'principal',
		'student1',
		'student2',
		'student3',
		'book1',
		'book2',
		'teacher1',
		'teacher2',
		'computer'
	],
	#category : 'Famix-Test3-Tests',
	#package : 'Famix-Test3-Tests'
}

{ #category : 'running' }
FamixTest3Test >> setUp [

	super setUp.

	model := FamixTest3Model new.

	school := FamixTest3School new.
	classroom1 := FamixTest3Classroom new.
	classroom2 := FamixTest3Classroom new.
	cafeteria := FamixTest3Cafeteria new.
	principal := FamixTest3Principal new.
	student1 := FamixTest3Student new.
	student2 := FamixTest3Student new.
	student2 firstName: 'firstname'.
	student2 lastName: 'lastName'.
	student3 := FamixTest3Student new.
	teacher1 := FamixTest3Teacher new.
	teacher1 firstName: 'John'.
	teacher2 := FamixTest3Teacher new.
	teacher2 firstName: 'Bob'.
	book1 := FamixTest3Book new.
	book2 := FamixTest3Book new.
	computer := FamixTest3Computer new.

	model addAll: {
			school.
			classroom1.
			classroom2.
			cafeteria.
			principal.
			student1.
			student2.
			student3.
			book1.
			book2.
			teacher1.
			teacher2.
			computer }.

	school students: {
			student1.
			student2.
			student3 }.
	school teachers: {
			teacher1.
			teacher2 }.
	teacher1 students: {
			student1.
			student2 }.
	teacher2 students: { student3 }.
	school principal: principal.
	school rooms: {
			classroom1.
			classroom2.
			cafeteria }.
	book1 person: student1.
	book2 person: principal.
	classroom1 computer: computer
]

{ #category : 'tests' }
FamixTest3Test >> testAbstractClasses [

	self assert: FamixTest3Entity isAbstract.
	self assert: FamixTest3Person isAbstract
]

{ #category : 'tests' }
FamixTest3Test >> testEqualityStudent [

	| sameStudent |
	"A copy of student2 to test same"
	sameStudent := FamixTest3Student new.
	sameStudent firstName: 'firstname'.
	sameStudent lastName: 'lastName'.

	self assert: student2 equals: sameStudent
]

{ #category : 'tests' }
FamixTest3Test >> testModelNotImportableFromFile [
	self deny: FamixTest3Model canBeImportedFromFile
]

{ #category : 'tests' }
FamixTest3Test >> testRelations [
	self assert: (principal books includes: book2).
	self assert: (student1 books includes: book1).
	self assert: classroom1 school equals: school.
	self assert: principal school equals: school.
	self assert: (student1 teachers includes: teacher1).
	self deny: (student1 teachers includes: teacher2)
]

{ #category : 'tests' }
FamixTest3Test >> testStoredOneToOneContainmentNotDuplicatedByRoundTrip [
	"Regression test: a stored one-to-one containment relation (classroom <>- computer) must not
	be duplicated by the export/import round trip."

	self assert: classroom1 computer equals: computer.
	self assert: computer classroom equals: classroom1.
	self assert: (model allWithType: FamixTest3Computer) size equals: 1
]
