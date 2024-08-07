Class {
	#name : #FamixTest4Generator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'book',
		'person',
		'principal',
		'student',
		'teacher',
		'school',
		'schoolBoard',
		'playground',
		'room',
		'classroom',
		'cafeteria',
		'restroom',
		'computer',
		'desk'
	],
	#category : #'Famix-TestGenerators'
}

{ #category : #accessing }
FamixTest4Generator class >> packageName [

	^ #'Famix-Test4-Entities'
]

{ #category : #accessing }
FamixTest4Generator class >> prefix [

	^ #'FamixTest4'
]

{ #category : #definition }
FamixTest4Generator >> adoptBuilder: aBuilder [

	super adoptBuilder: aBuilder.

	aBuilder configuration navigationForNonContainers: true.
]

{ #category : #definition }
FamixTest4Generator >> defineClasses [

	super defineClasses.

	book := builder newClassNamed: #Book.
	person := builder newAbstractClassNamed: #Person.
	principal := builder newClassNamed: #Principal.
	student := builder newClassNamed: #Student.
	teacher := builder newClassNamed: #Teacher.
	school := builder newClassNamed: #School.
	room := builder newClassNamed: #Room.
	classroom := builder newClassNamed: #Classroom.
	cafeteria := builder newClassNamed: #Cafeteria
]

{ #category : #definition }
FamixTest4Generator >> defineHierarchy [
	super defineHierarchy.

	principal --|> person.
	student --|> person.
	teacher --|> person.
	classroom --|> room.
	cafeteria --|> room
]

{ #category : #definition }
FamixTest4Generator >> defineProperties [

	super defineProperties.

	(builder ensureClassNamed: #Entity) property: #name type: #String.

	person property: #firstName type: #String.
	person property: #lastName type: #String.
	person property: #age type: #Number.
	person withEqualityCheckOn: { #firstName. #lastName. #age }.

	book property: #id type: #Number.
	book withEqualityCheckOn: { #id }
]

{ #category : #definition }
FamixTest4Generator >> defineRelations [

	super defineRelations.

	book *-<> person.
	principal -<> school.
	student *-<> school.
	teacher *-<> school.
	student *-* teacher.
	(school <>-* room) withNavigation.
	
]
