"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.


"
Trait {
	#name : #FamixTest3TEntityCreator,
	#category : #'Famix-Test3-Entities-Model'
}

{ #category : #meta }
FamixTest3TEntityCreator classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-Test3-Entities'>
	<generated>
]

{ #category : #'entity creation' }
FamixTest3TEntityCreator >> newBook [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest3Book new
]

{ #category : #'entity creation' }
FamixTest3TEntityCreator >> newCafeteria [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest3Cafeteria new
]

{ #category : #'entity creation' }
FamixTest3TEntityCreator >> newClassSession [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest3ClassSession new
]

{ #category : #'entity creation' }
FamixTest3TEntityCreator >> newClassroom [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest3Classroom new
]

{ #category : #'entity creation' }
FamixTest3TEntityCreator >> newComputer [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest3Computer new
]

{ #category : #'entity creation' }
FamixTest3TEntityCreator >> newPrincipal [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest3Principal new
]

{ #category : #'entity creation' }
FamixTest3TEntityCreator >> newRoom [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest3Room new
]

{ #category : #'entity creation' }
FamixTest3TEntityCreator >> newSchool [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest3School new
]

{ #category : #'entity creation' }
FamixTest3TEntityCreator >> newStudent [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest3Student new
]

{ #category : #'entity creation' }
FamixTest3TEntityCreator >> newTeacher [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest3Teacher new
]
