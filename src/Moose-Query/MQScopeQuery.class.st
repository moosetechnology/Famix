"
Description
--------------------

I am an object representing a scoping query.

A scoping query is executed with a receiver and have multiple parameters:
- The direction of the scope (up/down/both in the containment DAG)
- Is it recursive or does it stop at one result?
- The kind of the scope to stop to (a class or trait or collection of those, any type?)
- A condition to stop looking for results?

Examples
--------------------

For examples check the class comment of MooseQuery.
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	direction:			<aDirectionStrategy>		A strategy managing the direction of the query (up/down/both in the containment tree).
	isRecursive:			<aBoolean>					If true, will look in the whole tree even if some results are found.
	receiver:				<anEntity>					The receiver of the query (optional, is used when we call #execute without parameter).
	result:				<aSet>							Set of results found for the query.
	typeStrategy:		<aScopeStrategy>			A strategy defining the kinds of entities matching the query.
	until:					<aValuable>					An optional condition to stop the lookup.

"
Class {
	#name : #MQScopeQuery,
	#superclass : #MQAbstractQuery,
	#instVars : [
		'until',
		'isRecursive',
		'direction',
		'typeStrategy'
	],
	#category : #'Moose-Query-Scoping'
}

{ #category : #'instance creation' }
MQScopeQuery class >> recursivelyScope: aFamixType direction: aClass [
	^ (self scope: aFamixType direction: aClass)
		beRecursive;
		yourself
]

{ #category : #'instance creation' }
MQScopeQuery class >> recursivelyScope: aFamixType direction: aClass until: aValuable [
	^ (self recursivelyScope: aFamixType direction: aClass)
		until: aValuable;
		yourself
]

{ #category : #'instance creation' }
MQScopeQuery class >> recursivelyScopes: aCollectionOfType direction: aClass [
	^ (self scopes: aCollectionOfType direction: aClass)
		beRecursive;
		yourself
]

{ #category : #'instance creation' }
MQScopeQuery class >> recursivelyScopes: aCollectionOfType direction: aClass until: aValuable [
	^ (self scopes: aCollectionOfType direction: aClass until: aValuable)
		beRecursive;
		yourself
]

{ #category : #'instance creation' }
MQScopeQuery class >> scope: aFamixType direction: aClass [
	^ self new
		typeStrategy: (MQScopeTypeStrategy scope: aFamixType);
		direction: aClass;
		yourself
]

{ #category : #'instance creation' }
MQScopeQuery class >> scope: aFamixType direction: aClass until: aValuable [
	^ (self scope: aFamixType direction: aClass)
		until: aValuable;
		yourself
]

{ #category : #'instance creation' }
MQScopeQuery class >> scopes: aCollectionOfType direction: aClass [
	^ self new
		typeStrategy: (MQScopeTypesStrategy scopes: aCollectionOfType);
		direction: aClass;
		yourself
]

{ #category : #'instance creation' }
MQScopeQuery class >> scopes: aCollectionOfType direction: aClass until: aValuable [
	^ (self scopes: aCollectionOfType direction: aClass)
		until: aValuable;
		yourself
]

{ #category : #adding }
MQScopeQuery >> add: anEntity [
	self result add: anEntity
]

{ #category : #accessing }
MQScopeQuery >> beRecursive [
	isRecursive := true
]

{ #category : #accessing }
MQScopeQuery >> direction [
	^ direction
]

{ #category : #accessing }
MQScopeQuery >> direction: anObject [
	direction := anObject
]

{ #category : #execution }
MQScopeQuery >> execute [
	^ direction scopeFor: receiver query: self
]

{ #category : #initialization }
MQScopeQuery >> initialize [
	super initialize.
	isRecursive := false.
	until := [ :each | false ]
]

{ #category : #accessing }
MQScopeQuery >> isRecursive [
	^ isRecursive
]

{ #category : #accessing }
MQScopeQuery >> isRecursive: anObject [
	isRecursive := anObject
]

{ #category : #DSL }
MQScopeQuery >> ofAnyType [
	typeStrategy := MQScopeAllTypesStrategy new.
	^ self execute
]

{ #category : #DSL }
MQScopeQuery >> ofAnyType: aCollection [
	typeStrategy := MQScopeTypesStrategy scopes: aCollection.
	^ self execute
]

{ #category : #DSL }
MQScopeQuery >> ofType: aFamixType [
	typeStrategy := MQScopeTypeStrategy scope: aFamixType.
	^ self execute
]

{ #category : #DSL }
MQScopeQuery >> recursively [
	isRecursive := true
]

{ #category : #execution }
MQScopeQuery >> scopeFor: anEntity direction: aDirection [
	| selectors |
	(self typeStrategy shouldBeSelected: anEntity)
		ifTrue: [ self add: anEntity.
			self isRecursive ifFalse: [ ^ self result ] ].

	"The content of this block could be much more readable with #do: but we do this solution for performances... We need this method to be really really performant."
	(self shouldStopOn: anEntity)
		ifFalse: [ 1 to: (selectors := aDirection selectorsFor: anEntity) size do: [ :ind | (anEntity perform: (selectors at: ind)) scopeForQuery: self direction: aDirection ] ].
	^ self result
]

{ #category : #testing }
MQScopeQuery >> shouldStopOn: anEntity [
	^ self until value: anEntity
]

{ #category : #accessing }
MQScopeQuery >> typeStrategy [
	^ typeStrategy
]

{ #category : #accessing }
MQScopeQuery >> typeStrategy: anObject [
	typeStrategy := anObject
]

{ #category : #accessing }
MQScopeQuery >> until [
	^ until
]

{ #category : #DSL }
MQScopeQuery >> until: anObject [
	until := anObject
]

{ #category : #DSL }
MQScopeQuery >> withProperty: aSymbol [
	typeStrategy := MQScopePropertyStrategy property: aSymbol. 
	^ self execute
]
