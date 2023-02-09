"
basic class for generated importing contexts
"
Class {
	#name : #FmxImportingContext,
	#superclass : #Object,
	#instVars : [
		'imports'
	],
	#category : #'Moose-Core'
}

{ #category : #'importing-filters' }
FmxImportingContext >> containersOf: aFM3Class [

	^ aFM3Class allContainerProperties flatCollectAsSet: [ :prop | 
		  prop type isFM3Trait
			  ifTrue: [ prop type classUsers ]
			  ifFalse: [ { prop type } ] ]
]

{ #category : #'importing-filters' }
FmxImportingContext >> import: aClassName [

	self
		import: (self class importedMetamodel elements detect: [ :e | 
				 e name = aClassName ])
		traversed: Set new
]

{ #category : #'importing-filters' }
FmxImportingContext >> import: aFM3Class traversed: traversedClasses [

	(traversedClasses includes: aFM3Class) ifTrue: [ ^ self ].

	self imports add: aFM3Class.
	traversedClasses add: aFM3Class.

	(self containersOf: aFM3Class) do: [ :fm3Behavior | 
		self import: fm3Behavior traversed: traversedClasses ]
]

{ #category : #'importing-filters' }
FmxImportingContext >> importMaximum [

	self imports: self class importedMetamodel classes
]

{ #category : #accessing }
FmxImportingContext >> imports [

	^ imports
]

{ #category : #accessing }
FmxImportingContext >> imports: anObject [

	imports := anObject
]

{ #category : #initialization }
FmxImportingContext >> initialize [

	super initialize.
	imports := Set new
]

{ #category : #testing }
FmxImportingContext >> shouldImport: aClass [

	^ self imports includes: aClass
]
