"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.


"
Trait {
	#name : #MooseTEntityCreator,
	#category : #'Moose-Core-Model'
}

{ #category : #meta }
MooseTEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'Moose-Core'>
	<generated>
	^ self
]

{ #category : #'entity creation' }
MooseTEntityCreator >> newAbstractGroup [

	<generated>
	^ self add: MooseAbstractGroup new
]

{ #category : #'entity creation' }
MooseTEntityCreator >> newEntity [

	<generated>
	^ self add: MooseEntity new
]

{ #category : #'entity creation' }
MooseTEntityCreator >> newGroup [

	<generated>
	^ self add: MooseGroup new
]

{ #category : #'entity creation' }
MooseTEntityCreator >> newModel [

	<generated>
	^ self add: MooseModel new
]

{ #category : #'entity creation' }
MooseTEntityCreator >> newObject [

	<generated>
	^ self add: MooseObject new
]

{ #category : #'entity creation' }
MooseTEntityCreator >> newSpecializedGroup [

	<generated>
	^ self add: MooseSpecializedGroup new
]
