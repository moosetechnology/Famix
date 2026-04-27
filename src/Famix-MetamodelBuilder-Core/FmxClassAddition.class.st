"
Description
--------------------

I represent a change that would create a class during a Famix generation.

Examples
--------------------

	FmxClassAddition definition: 'MooseModel subclass: #FmxStMooseModel
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Famix-Smalltalk-Entities'''
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	definition:		<aString>		The definition of the class to create.

"
Class {
	#name : 'FmxClassAddition',
	#superclass : 'FmxBehavioralAddition',
	#instVars : [
		'superclass'
	],
	#category : 'Famix-MetamodelBuilder-Core-Changes',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Changes'
}

{ #category : 'accessing' }
FmxClassAddition class >> priority [
	"Class addition/update happens before we update and add methods."

	^ 4
]

{ #category : 'accessing' }
FmxClassAddition >> followingChangesIn: changes [
	"I should declare that each class with me as superclass should be built after me."

	| result |
	result := super followingChangesIn: changes.
	result addAll: (changes select: [ :change | change priority = self priority and: [ change superclass = name ] ]).
	^ result
]

{ #category : 'accessing' }
FmxClassAddition >> initialize: builder [

	builder superclass: (self class environment at: superclass)
]

{ #category : 'testing' }
FmxClassAddition >> isRequired [

	| realClass |
	super isRequired ifTrue: [ ^ true ].

	(realClass := self realClass) isTrait ifTrue: [ ^ true ].
	^ self superclass ~= realClass superclass name
]

{ #category : 'accessing' }
FmxClassAddition >> superclass [
	^ superclass
]

{ #category : 'accessing' }
FmxClassAddition >> superclass: anObject [
	superclass := anObject
]
