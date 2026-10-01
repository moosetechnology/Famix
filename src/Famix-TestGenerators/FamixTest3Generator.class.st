Class {
	#name : 'FamixTest3Generator',
	#superclass : 'FamixMetamodelGenerator',
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
		'desk',
		'tTeacher',
		'tClassroom',
		'classSession'
	],
	#category : 'Famix-TestGenerators',
	#package : 'Famix-TestGenerators'
}

{ #category : 'accessing' }
FamixTest3Generator class >> packageName [

	^ #'Famix-Test3-Entities'
]

{ #category : 'accessing' }
FamixTest3Generator class >> prefix [

	^ #'FamixTest3'
]

{ #category : 'accessing' }
FamixTest3Generator class >> submetamodels [

	^ { FamixGenerator }
]

{ #category : 'definition' }
FamixTest3Generator >> defineAssociations [
	"The source: and target: defaults are used on purpose: they are the only variants that
	name the opposite properties outgoing<ClassName>s and incoming<ClassName>s. The
	one-to-one and one-to-many variants do not pluralize the association name."

	super defineAssociations.

	classSession := (self builder association: #ClassSession)
		                source: tTeacher;
		                target: tClassroom;
		                yourself
]

{ #category : 'definition' }
FamixTest3Generator >> defineClasses [

	super defineClasses.

	book := builder newClassNamed: #Book.
	person := builder newAbstractClassNamed: #Person.
	principal := builder newClassNamed: #Principal.
	student := builder newClassNamed: #Student.
	teacher := builder newClassNamed: #Teacher.
	school := builder newClassNamed: #School.
	room := builder newClassNamed: #Room.
	classroom := builder newClassNamed: #Classroom.
	cafeteria := builder newClassNamed: #Cafeteria.
	computer := builder newClassNamed: #Computer
]

{ #category : 'definition' }
FamixTest3Generator >> defineHierarchy [

	super defineHierarchy.

	principal --|> person.
	student --|> person.
	teacher --|> person.
	classroom --|> room.
	cafeteria --|> room.

	"TTeacher -> ClassSession -> TClassroom"
	teacher --|> tTeacher.
	classroom --|> tClassroom
]

{ #category : 'definition' }
FamixTest3Generator >> defineProperties [

	super defineProperties.

	(builder ensureClassNamed: #Entity) property: #name type: #String.

	person property: #firstName type: #String.
	person property: #lastName type: #String.
	person property: #age type: #Number.
	person withEqualityCheckOn: { #firstName. #lastName. #age }.

	book property: #id type: #Number.
	book withEqualityCheckOn: { #id }.

	room property: #capacity type: #Number defaultValue: 12.
	room property: #hasWindows type: #Boolean defaultValue: true.
	room property: #purpose type: #String defaultValue: ''.

	classroom property: #hasProjector type: #Boolean defaultValue: false
]

{ #category : 'definition' }
FamixTest3Generator >> defineRelations [

	super defineRelations.

	book *-<> person.
	principal -<> school.
	student *-<> school.
	teacher *-<> school.
	student *-* teacher.
	school <>-* room.
	classroom <>- computer
]

{ #category : 'definition' }
FamixTest3Generator >> defineTraits [
	"TTeacher -> ClassSession -> TClassroom"

	super defineTraits.

	tTeacher := self builder newTraitNamed: #TTeacher.
	tClassroom := self builder newTraitNamed: #TClassroom
]
