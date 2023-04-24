"
This trait is used by Famix models.
It provides an API for creating new entities and adding them in the model.
"
Trait {
	#name : #FamixTest4TEntityCreator,
	#category : #'Famix-Test4-Entities-Traits'
}

{ #category : #meta }
FamixTest4TEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-Test4-Entities'>
	<generated>
	^ self
]

{ #category : #'entity creation' }
FamixTest4TEntityCreator >> newBook [

	<generated>
	^ self add: FamixTest4Book new
]

{ #category : #'entity creation' }
FamixTest4TEntityCreator >> newCafeteria [

	<generated>
	^ self add: FamixTest4Cafeteria new
]

{ #category : #'entity creation' }
FamixTest4TEntityCreator >> newClassroom [

	<generated>
	^ self add: FamixTest4Classroom new
]

{ #category : #'entity creation' }
FamixTest4TEntityCreator >> newModel [

	<generated>
	^ self add: FamixTest4Model new
]

{ #category : #'entity creation' }
FamixTest4TEntityCreator >> newPrincipal [

	<generated>
	^ self add: FamixTest4Principal new
]

{ #category : #'entity creation' }
FamixTest4TEntityCreator >> newRoom [

	<generated>
	^ self add: FamixTest4Room new
]

{ #category : #'entity creation' }
FamixTest4TEntityCreator >> newSchool [

	<generated>
	^ self add: FamixTest4School new
]

{ #category : #'entity creation' }
FamixTest4TEntityCreator >> newStudent [

	<generated>
	^ self add: FamixTest4Student new
]

{ #category : #'entity creation' }
FamixTest4TEntityCreator >> newTeacher [

	<generated>
	^ self add: FamixTest4Teacher new
]
