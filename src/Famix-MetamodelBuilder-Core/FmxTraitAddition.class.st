Class {
	#name : 'FmxTraitAddition',
	#superclass : 'FmxBehavioralAddition',
	#category : 'Famix-MetamodelBuilder-Core-Changes',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Changes'
}

{ #category : 'accessing' }
FmxTraitAddition class >> priority [

	^ 3.5
]

{ #category : 'accessing' }
FmxTraitAddition >> followingChangesIn: changes [

	| result |
	result := super followingChangesIn: changes.
	result addAll: (changes select: [ :change | change priority = self priority and: [ change usesTrait: name ] ]).
	^ result
]

{ #category : 'accessing' }
FmxTraitAddition >> initialize: builder [

	builder beTrait
]

{ #category : 'testing' }
FmxTraitAddition >> isRequired [

	super isRequired ifTrue: [ ^ true ].

	^ self realClass isTrait not
]

{ #category : 'testing' }
FmxTraitAddition >> usesTrait: aString [
	"Return true if I use the trait named as the parameter."

	traits ifNil: [ ^ false ].

	^ traits includesSubstring: aString
]
