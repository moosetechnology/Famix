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
	#name : #MQNavigationDependencyAssociation,
	#superclass : #Object,
	#instVars : [
		'from',
		'to'
	],
	#category : #'Moose-Query-Navigating'
}

{ #category : #'instance creation' }
MQNavigationDependencyAssociation class >> newFrom: varOrBehavior to: aType [
	"some syntactic sugar"

	^ self new
		from: varOrBehavior ;
		to: aType ;
		yourself
]

{ #category : #converting }
MQNavigationDependencyAssociation >> asString [

	^ self from asString , ' -> ' , self to asString
]

{ #category : #accessing }
MQNavigationDependencyAssociation >> from [
	^ from
]

{ #category : #accessing }
MQNavigationDependencyAssociation >> from: anObject [
	from := anObject
]

{ #category : #testing }
MQNavigationDependencyAssociation >> isOfType: aClass [
	^ self class isOfType: aClass
]

{ #category : #converting }
MQNavigationDependencyAssociation >> printOn: aStream [

	aStream nextPutAll: self from asString.
	aStream nextPutAll: ' -> '.
	aStream nextPutAll: self to asString
]

{ #category : #accessing }
MQNavigationDependencyAssociation >> source [
	^ self from
]

{ #category : #accessing }
MQNavigationDependencyAssociation >> source: anObject [
	self from: anObject
]

{ #category : #accessing }
MQNavigationDependencyAssociation >> target [
	^ self to
]

{ #category : #accessing }
MQNavigationDependencyAssociation >> target: anObject [
	self to: anObject
]

{ #category : #accessing }
MQNavigationDependencyAssociation >> to [
	^ to
]

{ #category : #accessing }
MQNavigationDependencyAssociation >> to: anObject [
	to := anObject
]
