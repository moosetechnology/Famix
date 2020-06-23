"
A fake association to represent ""direct"" dependencies in MooseQuery (MooseIncoming/OutgoingQueryResult)

Entities have incoming/outgoing dependencies between themselves :
- through associations, for example when a Method has accesses on Variables.
- through ""direct relations"", for example when a Variable is typed by a Type

These dependencies can be queried: #queryIncomingDependencies / #queryOutgoingDependencies, but (for historical reasons), the queries are expected to return associations

This class models a fake association for direct dependencies 
Instance Variables:
	from	-- the Entity on the dependencySource side of the relation
	to	   -- the Entity on the dependencyTarget side of the relation
"
Class {
	#name : #MooseQueryDependencyAssociation,
	#superclass : #Object,
	#instVars : [
		'from',
		'to'
	],
	#category : #'Moose-Query-Navigating'
}

{ #category : #'instance creation' }
MooseQueryDependencyAssociation class >> newFrom: varOrBehavior to: aType [
	"some syntactic sugar"

	^ self new
		from: varOrBehavior ;
		to: aType ;
		yourself
]

{ #category : #converting }
MooseQueryDependencyAssociation >> asString [

	^ self from asString , ' -> ' , self to asString
]

{ #category : #accessing }
MooseQueryDependencyAssociation >> from [
	^ from
]

{ #category : #accessing }
MooseQueryDependencyAssociation >> from: anObject [
	from := anObject
]

{ #category : #converting }
MooseQueryDependencyAssociation >> printOn: aStream [

	aStream nextPutAll: self from asString.
	aStream nextPutAll: ' -> '.
	aStream nextPutAll: self to asString
]

{ #category : #accessing }
MooseQueryDependencyAssociation >> source [
	^ self from
]

{ #category : #accessing }
MooseQueryDependencyAssociation >> source: anObject [
	self from: anObject
]

{ #category : #accessing }
MooseQueryDependencyAssociation >> target [
	^ self to
]

{ #category : #accessing }
MooseQueryDependencyAssociation >> target: anObject [
	self to: anObject
]

{ #category : #accessing }
MooseQueryDependencyAssociation >> to [
	^ to
]

{ #category : #accessing }
MooseQueryDependencyAssociation >> to: anObject [
	to := anObject
]
