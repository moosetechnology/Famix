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
		'creationCode'
	],
	#category : #'Famix-MetamodelBuilder-Core-Changes'
}

{ #category : #'instance creation' }
FmxClassAddition class >> creationCode: aString [
	^ self new
		creationCode: aString;
		yourself
]

{ #category : #accessing }
FmxClassAddition >> apply [

	self class compiler evaluate: self creationCode
]

{ #category : #accessing }
FmxClassAddition >> creationCode [
	^ creationCode
]

{ #category : #accessing }
FmxClassAddition >> creationCode: anObject [
	creationCode := anObject
]
