"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.


"
Trait {
	#name : 'FamixTest3TEntityCreator',
	#category : 'Famix-Test3-Entities-Model',
	#package : 'Famix-Test3-Entities',
	#tag : 'Model'
}

{ #category : 'meta' }
FamixTest3TEntityCreator classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-Test3-Entities'>
	<generated>
]

{ #category : 'entity creation' }
FamixTest3TEntityCreator >> newAccess [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest3Access new
]

{ #category : 'entity creation' }
FamixTest3TEntityCreator >> newAttribute [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest3Attribute new
]

{ #category : 'entity creation' }
FamixTest3TEntityCreator >> newAttributeNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixTest3Attribute named: aName)
]

{ #category : 'entity creation' }
FamixTest3TEntityCreator >> newClass [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest3Class new
]

{ #category : 'entity creation' }
FamixTest3TEntityCreator >> newClassNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixTest3Class named: aName)
]

{ #category : 'entity creation' }
FamixTest3TEntityCreator >> newComment [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest3Comment new
]

{ #category : 'entity creation' }
FamixTest3TEntityCreator >> newInvocation [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest3Invocation new
]

{ #category : 'entity creation' }
FamixTest3TEntityCreator >> newMethod [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest3Method new
]

{ #category : 'entity creation' }
FamixTest3TEntityCreator >> newMethodNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixTest3Method named: aName)
]

{ #category : 'entity creation' }
FamixTest3TEntityCreator >> newPackage [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest3Package new
]

{ #category : 'entity creation' }
FamixTest3TEntityCreator >> newPackageNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixTest3Package named: aName)
]

{ #category : 'entity creation' }
FamixTest3TEntityCreator >> newParametricClass [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest3ParametricClass new
]

{ #category : 'entity creation' }
FamixTest3TEntityCreator >> newParametricClassNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixTest3ParametricClass named: aName)
]

{ #category : 'entity creation' }
FamixTest3TEntityCreator >> newPrimitiveType [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest3PrimitiveType new
]

{ #category : 'entity creation' }
FamixTest3TEntityCreator >> newPrimitiveTypeNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixTest3PrimitiveType named: aName)
]

{ #category : 'entity creation' }
FamixTest3TEntityCreator >> newReference [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest3Reference new
]

{ #category : 'entity creation' }
FamixTest3TEntityCreator >> newSourceLanguage [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest3SourceLanguage new
]

{ #category : 'entity creation' }
FamixTest3TEntityCreator >> newSourceTextAnchor [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest3SourceTextAnchor new
]

{ #category : 'entity creation' }
FamixTest3TEntityCreator >> newType [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest3Type new
]

{ #category : 'entity creation' }
FamixTest3TEntityCreator >> newTypeNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixTest3Type named: aName)
]
