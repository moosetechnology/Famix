"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.


"
Trait {
	#name : 'FamixTest4TEntityCreator',
	#category : 'Famix-Test4-Entities-Model',
	#package : 'Famix-Test4-Entities',
	#tag : 'Model'
}

{ #category : 'meta' }
FamixTest4TEntityCreator classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-Test4-Entities'>
	<generated>
]

{ #category : 'entity creation' }
FamixTest4TEntityCreator >> newBook [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest4Book new
]

{ #category : 'entity creation' }
FamixTest4TEntityCreator >> newCafeteria [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest4Cafeteria new
]

{ #category : 'entity creation' }
FamixTest4TEntityCreator >> newClassroom [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest4Classroom new
]

{ #category : 'entity creation' }
FamixTest4TEntityCreator >> newPrincipal [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest4Principal new
]

{ #category : 'entity creation' }
FamixTest4TEntityCreator >> newRoom [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest4Room new
]

{ #category : 'entity creation' }
FamixTest4TEntityCreator >> newSchool [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest4School new
]

{ #category : 'entity creation' }
FamixTest4TEntityCreator >> newStudent [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest4Student new
]

{ #category : 'entity creation' }
FamixTest4TEntityCreator >> newTeacher [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest4Teacher new
]
