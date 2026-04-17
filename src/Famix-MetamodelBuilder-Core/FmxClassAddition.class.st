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

	| makeBlock |
	makeBlock := [ :builder |
		             self flag: #todo. "Check if we can avoid the compilier evaluation"
		             self initialize: builder.
		             builder
			             name: name;
			             package: package;
			             tag: tag.

		             traits ifNotNil: [ builder traits: (self class compiler evaluate: traits) ].
		             slots ifNotNil: [ builder slots: (self class compiler evaluate: slots) ] ].

	"If the class already exist we update it to not remove the class slots and shared variables."
	self class environment
		at: name
		ifPresent: [ :class | self class classInstaller update: class to: makeBlock ]
		ifAbsent: [ self class classInstaller make: makeBlock ]
]

{ #category : 'accessing' }
FmxClassAddition >> initialize: builder [

	self flag: #todo. "Traits should not have a superclass name."
	self flag: #todo. "Remove the nil setting once this will be fixed: https://github.com/pharo-project/pharo/issues/19572"
	builder
		superclass: nil;
		superclassName: superclass
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
