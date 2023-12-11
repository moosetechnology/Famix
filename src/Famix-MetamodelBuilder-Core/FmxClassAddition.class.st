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
	#name : #FmxClassAddition,
	#superclass : #FmxCodeChange,
	#instVars : [
		'definition'
	],
	#category : #'Famix-MetamodelBuilder-Core-Changes'
}

{ #category : #'instance creation' }
FmxClassAddition class >> definition: aString [
	^ self new
		definition: aString;
		yourself
]

{ #category : #accessing }
FmxClassAddition >> apply [

	| installation |
	installation := self definition.
	"In Pharo 12 the definition string does not install the class, it just builds a builder. Thus we need to install it explicitly.
	When Moose will have its minimal version on P12 we should probably refactor to not hold a string but manage ShiftClassBuilder instance directly. In the meantime here is a quick fix to have this work in P11 and P12."
	SystemVersion current major < 12 ifFalse: [ installation := installation , '; install' ].
	self class compiler evaluate: installation
]

{ #category : #accessing }
FmxClassAddition >> definition [
	^ definition
]

{ #category : #accessing }
FmxClassAddition >> definition: anObject [
	definition := anObject
]
