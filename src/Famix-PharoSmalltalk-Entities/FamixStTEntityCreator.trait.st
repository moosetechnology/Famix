"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.


"
Trait {
	#name : 'FamixStTEntityCreator',
	#category : 'Famix-PharoSmalltalk-Entities-Model',
	#package : 'Famix-PharoSmalltalk-Entities',
	#tag : 'Model'
}

{ #category : 'meta' }
FamixStTEntityCreator classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
]

{ #category : 'entity creation' }
FamixStTEntityCreator >> newAccess [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixStAccess new
]

{ #category : 'entity creation' }
FamixStTEntityCreator >> newAnnotationInstance [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixStAnnotationInstance new
]

{ #category : 'entity creation' }
FamixStTEntityCreator >> newAnnotationInstanceAttribute [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixStAnnotationInstanceAttribute new
]

{ #category : 'entity creation' }
FamixStTEntityCreator >> newAnnotationType [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixStAnnotationType new
]

{ #category : 'entity creation' }
FamixStTEntityCreator >> newAnnotationTypeAttribute [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixStAnnotationTypeAttribute new
]

{ #category : 'entity creation' }
FamixStTEntityCreator >> newAnnotationTypeAttributeNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixStAnnotationTypeAttribute named: aName)
]

{ #category : 'entity creation' }
FamixStTEntityCreator >> newAnnotationTypeNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixStAnnotationType named: aName)
]

{ #category : 'entity creation' }
FamixStTEntityCreator >> newAttribute [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixStAttribute new
]

{ #category : 'entity creation' }
FamixStTEntityCreator >> newAttributeNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixStAttribute named: aName)
]

{ #category : 'entity creation' }
FamixStTEntityCreator >> newClass [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixStClass new
]

{ #category : 'entity creation' }
FamixStTEntityCreator >> newClassNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixStClass named: aName)
]

{ #category : 'entity creation' }
FamixStTEntityCreator >> newComment [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixStComment new
]

{ #category : 'entity creation' }
FamixStTEntityCreator >> newEntityTyping [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixStEntityTyping new
]

{ #category : 'entity creation' }
FamixStTEntityCreator >> newGlobalVariable [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixStGlobalVariable new
]

{ #category : 'entity creation' }
FamixStTEntityCreator >> newGlobalVariableNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixStGlobalVariable named: aName)
]

{ #category : 'entity creation' }
FamixStTEntityCreator >> newImplicitVariable [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixStImplicitVariable new
]

{ #category : 'entity creation' }
FamixStTEntityCreator >> newImplicitVariableNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixStImplicitVariable named: aName)
]

{ #category : 'entity creation' }
FamixStTEntityCreator >> newInheritance [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixStInheritance new
]

{ #category : 'entity creation' }
FamixStTEntityCreator >> newInvocation [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixStInvocation new
]

{ #category : 'entity creation' }
FamixStTEntityCreator >> newLocalVariable [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixStLocalVariable new
]

{ #category : 'entity creation' }
FamixStTEntityCreator >> newLocalVariableNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixStLocalVariable named: aName)
]

{ #category : 'entity creation' }
FamixStTEntityCreator >> newMethod [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixStMethod new
]

{ #category : 'entity creation' }
FamixStTEntityCreator >> newMethodNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixStMethod named: aName)
]

{ #category : 'entity creation' }
FamixStTEntityCreator >> newNamespace [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixStNamespace new
]

{ #category : 'entity creation' }
FamixStTEntityCreator >> newNamespaceNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixStNamespace named: aName)
]

{ #category : 'entity creation' }
FamixStTEntityCreator >> newPackage [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixStPackage new
]

{ #category : 'entity creation' }
FamixStTEntityCreator >> newPackageNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixStPackage named: aName)
]

{ #category : 'entity creation' }
FamixStTEntityCreator >> newParameter [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixStParameter new
]

{ #category : 'entity creation' }
FamixStTEntityCreator >> newParameterNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixStParameter named: aName)
]

{ #category : 'entity creation' }
FamixStTEntityCreator >> newPharoEntitySourceAnchor [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixStPharoEntitySourceAnchor new
]

{ #category : 'entity creation' }
FamixStTEntityCreator >> newReference [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixStReference new
]

{ #category : 'entity creation' }
FamixStTEntityCreator >> newSourceLanguage [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixStSourceLanguage new
]

{ #category : 'entity creation' }
FamixStTEntityCreator >> newSourceTextAnchor [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixStSourceTextAnchor new
]

{ #category : 'entity creation' }
FamixStTEntityCreator >> newUnknownVariable [

	<ignoreForCoverage>
	<generated>
	^ self add: FamixStUnknownVariable new
]

{ #category : 'entity creation' }
FamixStTEntityCreator >> newUnknownVariableNamed: aName [

	<ignoreForCoverage>
	<generated>
	^ self add: (FamixStUnknownVariable named: aName)
]
