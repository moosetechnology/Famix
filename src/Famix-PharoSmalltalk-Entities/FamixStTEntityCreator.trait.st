"
This trait is used by Famix models.
It provides an API for creating new entities and adding them in the model.
"
Trait {
	#name : #FamixStTEntityCreator,
	#category : #'Famix-PharoSmalltalk-Entities-Model'
}

{ #category : #meta }
FamixStTEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^ self
]

{ #category : #'entity creation' }
FamixStTEntityCreator >> newAccess [

	<generated>
	^ self add: FamixStAccess new
]

{ #category : #'entity creation' }
FamixStTEntityCreator >> newAnnotationInstance [

	<generated>
	^ self add: FamixStAnnotationInstance new
]

{ #category : #'entity creation' }
FamixStTEntityCreator >> newAnnotationInstanceAttribute [

	<generated>
	^ self add: FamixStAnnotationInstanceAttribute new
]

{ #category : #'entity creation' }
FamixStTEntityCreator >> newAnnotationType [

	<generated>
	^ self add: FamixStAnnotationType new
]

{ #category : #'entity creation' }
FamixStTEntityCreator >> newAnnotationTypeAttribute [

	<generated>
	^ self add: FamixStAnnotationTypeAttribute new
]

{ #category : #'entity creation' }
FamixStTEntityCreator >> newAttribute [

	<generated>
	^ self add: FamixStAttribute new
]

{ #category : #'entity creation' }
FamixStTEntityCreator >> newClass [

	<generated>
	^ self add: FamixStClass new
]

{ #category : #'entity creation' }
FamixStTEntityCreator >> newComment [

	<generated>
	^ self add: FamixStComment new
]

{ #category : #'entity creation' }
FamixStTEntityCreator >> newGlobalVariable [

	<generated>
	^ self add: FamixStGlobalVariable new
]

{ #category : #'entity creation' }
FamixStTEntityCreator >> newImplicitVariable [

	<generated>
	^ self add: FamixStImplicitVariable new
]

{ #category : #'entity creation' }
FamixStTEntityCreator >> newInheritance [

	<generated>
	^ self add: FamixStInheritance new
]

{ #category : #'entity creation' }
FamixStTEntityCreator >> newInvocation [

	<generated>
	^ self add: FamixStInvocation new
]

{ #category : #'entity creation' }
FamixStTEntityCreator >> newLocalVariable [

	<generated>
	^ self add: FamixStLocalVariable new
]

{ #category : #'entity creation' }
FamixStTEntityCreator >> newMethod [

	<generated>
	^ self add: FamixStMethod new
]

{ #category : #'entity creation' }
FamixStTEntityCreator >> newModel [

	<generated>
	^ self add: FamixStModel new
]

{ #category : #'entity creation' }
FamixStTEntityCreator >> newNamespace [

	<generated>
	^ self add: FamixStNamespace new
]

{ #category : #'entity creation' }
FamixStTEntityCreator >> newPackage [

	<generated>
	^ self add: FamixStPackage new
]

{ #category : #'entity creation' }
FamixStTEntityCreator >> newParameter [

	<generated>
	^ self add: FamixStParameter new
]

{ #category : #'entity creation' }
FamixStTEntityCreator >> newPharoEntitySourceAnchor [

	<generated>
	^ self add: FamixStPharoEntitySourceAnchor new
]

{ #category : #'entity creation' }
FamixStTEntityCreator >> newReference [

	<generated>
	^ self add: FamixStReference new
]

{ #category : #'entity creation' }
FamixStTEntityCreator >> newSourceLanguage [

	<generated>
	^ self add: FamixStSourceLanguage new
]

{ #category : #'entity creation' }
FamixStTEntityCreator >> newSourceTextAnchor [

	<generated>
	^ self add: FamixStSourceTextAnchor new
]

{ #category : #'entity creation' }
FamixStTEntityCreator >> newUnknownSourceLanguage [

	<generated>
	^ self add: FamixStUnknownSourceLanguage new
]

{ #category : #'entity creation' }
FamixStTEntityCreator >> newUnknownVariable [

	<generated>
	^ self add: FamixStUnknownVariable new
]
