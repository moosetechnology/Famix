"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.


"
Trait {
	#name : 'FamixTest2TEntityCreator',
	#category : 'Famix-Test2-Entities-Model',
	#package : 'Famix-Test2-Entities',
	#tag : 'Model'
}

{ #category : 'meta' }
FamixTest2TEntityCreator classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-Test2-Entities'>
	<generated>
]

{ #category : 'entity creation' }
FamixTest2TEntityCreator >> newAccess [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest2Access new
]

{ #category : 'entity creation' }
FamixTest2TEntityCreator >> newAttribute [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest2Attribute new
]

{ #category : 'entity creation' }
FamixTest2TEntityCreator >> newAttributeNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixTest2Attribute named: aName)
]

{ #category : 'entity creation' }
FamixTest2TEntityCreator >> newClass [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest2Class new
]

{ #category : 'entity creation' }
FamixTest2TEntityCreator >> newClassNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixTest2Class named: aName)
]

{ #category : 'entity creation' }
FamixTest2TEntityCreator >> newComment [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest2Comment new
]

{ #category : 'entity creation' }
FamixTest2TEntityCreator >> newInvocation [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest2Invocation new
]

{ #category : 'entity creation' }
FamixTest2TEntityCreator >> newMethod [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest2Method new
]

{ #category : 'entity creation' }
FamixTest2TEntityCreator >> newMethodNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixTest2Method named: aName)
]

{ #category : 'entity creation' }
FamixTest2TEntityCreator >> newPackage [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest2Package new
]

{ #category : 'entity creation' }
FamixTest2TEntityCreator >> newPackageNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixTest2Package named: aName)
]

{ #category : 'entity creation' }
FamixTest2TEntityCreator >> newParametricClass [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest2ParametricClass new
]

{ #category : 'entity creation' }
FamixTest2TEntityCreator >> newParametricClassNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixTest2ParametricClass named: aName)
]

{ #category : 'entity creation' }
FamixTest2TEntityCreator >> newPrimitiveType [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest2PrimitiveType new
]

{ #category : 'entity creation' }
FamixTest2TEntityCreator >> newPrimitiveTypeNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixTest2PrimitiveType named: aName)
]

{ #category : 'entity creation' }
FamixTest2TEntityCreator >> newReference [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest2Reference new
]

{ #category : 'entity creation' }
FamixTest2TEntityCreator >> newSourceLanguage [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest2SourceLanguage new
]

{ #category : 'entity creation' }
FamixTest2TEntityCreator >> newSourceTextAnchor [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest2SourceTextAnchor new
]

{ #category : 'entity creation' }
FamixTest2TEntityCreator >> newType [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixTest2Type new
]

{ #category : 'entity creation' }
FamixTest2TEntityCreator >> newTypeNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixTest2Type named: aName)
]
