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
	#superclass : 'FmxCodeChange',
	#instVars : [
		'name',
		'superclass',
		'traits',
		'slots',
		'classSlots',
		'sharedVariables',
		'package',
		'tag'
	],
	#category : 'Famix-MetamodelBuilder-Core-Changes',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Changes'
}

{ #category : 'instance creation' }
FmxClassAddition class >> creationCode: aString [
	^ self new
		creationCode: aString;
		yourself
]

{ #category : 'accessing' }
FmxClassAddition class >> priority [
	"Class addition/update happens before we update and add methods."

	^ 4
]

{ #category : 'accessing' }
FmxClassAddition >> apply [

	Smalltalk classInstaller make: [ :builder |
			self flag: #todo. "Check if we can avoid the compilier evaluation"
			self initialize: builder.
			builder
				superclassName: superclass;
				name: name;
				traits: (self class compiler evaluate: traits);
				slots: (self class compiler evaluate: slots);
				classSlots: (self class compiler evaluate: classSlots);
				sharedVariables: (self class compiler evaluate: sharedVariables);
				package: package;
				tag: tag ]
]

{ #category : 'accessing' }
FmxClassAddition >> classSlots: anObject [
	classSlots := anObject
]

{ #category : 'accessing' }
FmxClassAddition >> initialize: builder [

	builder superclassName: superclass
]

{ #category : 'accessing' }
FmxClassAddition >> name: anObject [
	name := anObject
]

{ #category : 'accessing' }
FmxClassAddition >> package: anObject [
	package := anObject
]

{ #category : 'accessing' }
FmxClassAddition >> sharedVariables: anObject [
	sharedVariables := anObject
]

{ #category : 'accessing' }
FmxClassAddition >> slots: anObject [
	slots := anObject
]

{ #category : 'accessing' }
FmxClassAddition >> superclass: anObject [
	superclass := anObject
]

{ #category : 'accessing' }
FmxClassAddition >> tag: anObject [
	tag := anObject
]

{ #category : 'accessing' }
FmxClassAddition >> traits: anObject [
	traits := anObject
]
