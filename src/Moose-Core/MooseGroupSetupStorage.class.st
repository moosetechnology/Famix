Class {
	#name : #MooseGroupSetupStorage,
	#superclass : #MooseGroupStorage,
	#type : #variable,
	#instVars : [
		'elements'
	],
	#category : #'Moose-Core'
}

{ #category : #adding }
MooseGroupSetupStorage >> add: anElement [ 
	 
	^elements add: anElement
]

{ #category : #accessing }
MooseGroupSetupStorage >> allEntityTypes [
	^ self collectAsSet: [ :each | each class  ]
]

{ #category : #accessing }
MooseGroupSetupStorage >> at: uniqueName ifAbsent: exceptionBlock [ 
	 | s |
	s := uniqueName asSymbol.
	^self 
		detect: [:each | s == each mooseName asSymbol] 
		ifNone: exceptionBlock
]

{ #category : #'accessing-sequenceable' }
MooseGroupSetupStorage >> atIndex: index [ 
	 
	^elements at: index
]

{ #category : #enumerating }
MooseGroupSetupStorage >> do: aBlock [ 
	 
	^elements do: aBlock
]

{ #category : #accessing }
MooseGroupSetupStorage >> elements [

	^ self asArray
]

{ #category : #'accessing-sequenceable' }
MooseGroupSetupStorage >> first [ 
	 
	^elements first
]

{ #category : #initialization }
MooseGroupSetupStorage >> initialize [
	super initialize.

	elements := self species new: 10000
]

{ #category : #initialization }
MooseGroupSetupStorage >> initialize: capacity [

	super initialize: capacity.
	elements := self species new: capacity
]

{ #category : #'accessing-sequenceable' }
MooseGroupSetupStorage >> last [ 
	 
	^elements last
]

{ #category : #copying }
MooseGroupSetupStorage >> postCopy [  
	super postCopy.
	elements := elements copy
]

{ #category : #removing }
MooseGroupSetupStorage >> remove: anElement ifAbsent: exceptionBlock [ 
	 
	^elements remove: anElement ifAbsent: exceptionBlock
]

{ #category : #removing }
MooseGroupSetupStorage >> removeAll [ 
	 
	self initialize
]

{ #category : #enumerating }
MooseGroupSetupStorage >> selectAllWithType: aSmalltalkClass [ 
	^ self select: 
		[ :each | 
		"-- select returns an ArrayList"
		each class = aSmalltalkClass ]
]

{ #category : #accessing }
MooseGroupSetupStorage >> size [ 
	 
	^elements size
]

{ #category : #accessing }
MooseGroupSetupStorage >> species: anObject [

	"WARNING: Changing the species of the inner collection might have unattempted consequences.
	DO NOT EXECUTE THIS METHOD EXCEPT IF YOU ARE REALLY SURE OF YOUR NEED
	
	For instance, `model species: Set` would make indexed access to collection element impossible"

	super species: anObject.
	elements := self species withAll: elements
]
