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

	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^ self
]

{ #category : #'entity creation' }
FamixTest3TEntityCreator >> newAccess [

	<generated>
	^ self add: FamixTest3Access new
]

{ #category : #'entity creation' }
FamixTest3TEntityCreator >> newAttribute [

	<generated>
	^ self add: FamixTest3Attribute new
]

{ #category : #'entity creation' }
FamixTest3TEntityCreator >> newAttributeNamed: aName [

	<generated>
	^ self add: (FamixTest3Attribute named: aName)
]

{ #category : #'entity creation' }
FamixTest3TEntityCreator >> newClass [

	<generated>
	^ self add: FamixTest3Class new
]

{ #category : #'entity creation' }
FamixTest3TEntityCreator >> newClassNamed: aName [

	<generated>
	^ self add: (FamixTest3Class named: aName)
]

{ #category : #'entity creation' }
FamixTest3TEntityCreator >> newComment [

	<generated>
	^ self add: FamixTest3Comment new
]

{ #category : #'entity creation' }
FamixTest3TEntityCreator >> newInvocation [

	<generated>
	^ self add: FamixTest3Invocation new
]

{ #category : #'entity creation' }
FamixTest3TEntityCreator >> newMethod [

	<generated>
	^ self add: FamixTest3Method new
]

{ #category : #'entity creation' }
FamixTest3TEntityCreator >> newMethodNamed: aName [

	<generated>
	^ self add: (FamixTest3Method named: aName)
]

{ #category : #'entity creation' }
FamixTest3TEntityCreator >> newPackage [

	<generated>
	^ self add: FamixTest3Package new
]

{ #category : #'entity creation' }
FamixTest3TEntityCreator >> newPackageNamed: aName [

	<generated>
	^ self add: (FamixTest3Package named: aName)
]

{ #category : #'entity creation' }
FamixTest3TEntityCreator >> newPrimitiveType [

	<generated>
	^ self add: FamixTest3PrimitiveType new
]

{ #category : #'entity creation' }
FamixTest3TEntityCreator >> newReference [

	<generated>
	^ self add: FamixTest3Reference new
]

{ #category : #'entity creation' }
FamixTest3TEntityCreator >> newSourceLanguage [

	<generated>
	^ self add: FamixTest3SourceLanguage new
]

{ #category : #'entity creation' }
FamixTest3TEntityCreator >> newSourceTextAnchor [

	<generated>
	^ self add: FamixTest3SourceTextAnchor new
]

{ #category : #'entity creation' }
FamixTest3TEntityCreator >> newType [

	<generated>
	^ self add: FamixTest3Type new
]

{ #category : #'entity creation' }
FamixTest3TEntityCreator >> newTypeNamed: aName [

	<generated>
	^ self add: (FamixTest3Type named: aName)
]

{ #category : #'entity creation' }
FamixTest3TEntityCreator >> newUnknownSourceLanguage [

	<generated>
	^ self add: FamixTest3UnknownSourceLanguage new
]
