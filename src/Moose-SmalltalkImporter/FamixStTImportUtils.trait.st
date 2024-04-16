"
I am a trait used by the smalltalk importers adding some utilities to avoid duplication.

I save a collection of classes. I hold a factory to create FamixStEntities. And I hold an importing context to know which kind of entities I should create.
"
Trait {
	#name : #FamixStTImportUtils,
	#instVars : [
		'importingContext',
		'factory',
		'classes'
	],
	#category : #'Moose-SmalltalkImporter-Importers'
}

{ #category : #accessing }
FamixStTImportUtils >> classes [

	^ classes
]

{ #category : #accessing }
FamixStTImportUtils >> defaultImportingContext [
	^ MooseImportingContext new importMaximum
]

{ #category : #accessing }
FamixStTImportUtils >> factory [

	^ factory
]

{ #category : #accessing }
FamixStTImportUtils >> factory: anObject [

	factory := anObject
]

{ #category : #accessing }
FamixStTImportUtils >> importingContext [

	^ importingContext ifNil: [ importingContext := self defaultImportingContext ]
]

{ #category : #accessing }
FamixStTImportUtils >> importingContext: anObject [

	importingContext := anObject
]
