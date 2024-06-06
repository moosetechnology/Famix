"
Description
--------------------

I represent a the removal of slots from a class when updating an already generated metamodel.

"
Class {
	#name : #FmxSlotRemovals,
	#superclass : #FmxCodeChange,
	#instVars : [
		'slots'
	],
	#category : #'Famix-MetamodelBuilder-Core-Changes'
}

{ #category : #'as yet unclassified' }
FmxSlotRemovals class >> slots: aCollection [

	^ self new
		  slots: aCollection;
		  yourself
]

{ #category : #accessing }
FmxSlotRemovals >> apply [

	slots do: [ :e | e owningClass removeInstVarNamed: e name  ]
]

{ #category : #testing }
FmxSlotRemovals >> isRemoval [

	^ true
]

{ #category : #accessing }
FmxSlotRemovals >> slots [

	^ slots
]

{ #category : #accessing }
FmxSlotRemovals >> slots: anObject [

	slots := anObject
]
