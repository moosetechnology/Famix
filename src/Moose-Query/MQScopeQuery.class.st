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
	#name : 'MQScopeQuery',
	#superclass : 'MQAbstractQuery',
	#instVars : [
		'until',
		'isRecursive',
		'direction',
		'stopStrategy'
	],
	#category : 'Moose-Query-Scoping',
	#package : 'Moose-Query',
	#tag : 'Scoping'
}

{ #category : 'instance creation' }
MQScopeQuery class >> recursivelyScope: aFamixType direction: aClass [
	^ (self scope: aFamixType direction: aClass)
		beRecursive;
		yourself
]

{ #category : 'instance creation' }
MQScopeQuery class >> recursivelyScope: aFamixType direction: aClass until: aValuable [
	^ (self recursivelyScope: aFamixType direction: aClass)
		until: aValuable;
		yourself
]

{ #category : 'instance creation' }
MQScopeQuery class >> recursivelyScopes: aCollectionOfType direction: aClass [
	^ (self scopes: aCollectionOfType direction: aClass)
		beRecursive;
		yourself
]

{ #category : 'instance creation' }
MQScopeQuery class >> recursivelyScopes: aCollectionOfType direction: aClass until: aValuable [
	^ (self scopes: aCollectionOfType direction: aClass until: aValuable)
		beRecursive;
		yourself
]

{ #category : 'instance creation' }
MQScopeQuery class >> scope: aFamixType direction: aClass [
	^ self new
		stopStrategy: (MQScopeTypeStrategy scope: aFamixType);
		direction: aClass;
		yourself
]

{ #category : 'instance creation' }
MQScopeQuery class >> scope: aFamixType direction: aClass until: aValuable [
	^ (self scope: aFamixType direction: aClass)
		until: aValuable;
		yourself
]

{ #category : 'instance creation' }
MQScopeQuery class >> scopes: aCollectionOfType direction: aClass [
	^ self new
		stopStrategy: (MQScopeAnyTypeStrategy scopes: aCollectionOfType);
		direction: aClass;
		yourself
]

{ #category : 'instance creation' }
MQScopeQuery class >> scopes: aCollectionOfType direction: aClass until: aValuable [
	^ (self scopes: aCollectionOfType direction: aClass)
		until: aValuable;
		yourself
]

{ #category : 'adding' }
MQScopeQuery >> add: anEntity [
	self result add: anEntity
]

{ #category : 'accessing' }
MQScopeQuery >> beRecursive [
	isRecursive := true
]

{ #category : 'accessing' }
MQScopeQuery >> direction [
	^ direction
]

{ #category : 'accessing' }
MQScopeQuery >> direction: anObject [
	direction := anObject
]

{ #category : 'execution' }
MQScopeQuery >> execute [

	^ self scopeFor: { receiver }
]

{ #category : 'initialization' }
MQScopeQuery >> initialize [

	super initialize.
	isRecursive := false
]

{ #category : 'accessing' }
MQScopeQuery >> isRecursive [
	^ isRecursive
]

{ #category : 'accessing' }
MQScopeQuery >> isRecursive: anObject [
	isRecursive := anObject
]

{ #category : 'execution' }
MQScopeQuery >> isUniform: aCollection [

	| class |
	class := (aCollection at: 1) class.
	1 to: aCollection size do: [ :index | (aCollection at: index) class = class ifFalse: [ ^ false ] ].

	^ true
]

{ #category : 'DSL' }
MQScopeQuery >> ofAnyType [
	stopStrategy := MQScopeAllTypesStrategy new.
	^ self execute
]

{ #category : 'DSL' }
MQScopeQuery >> ofAnyType: aCollection [
	stopStrategy := MQScopeAnyTypeStrategy scopes: aCollection.
	^ self execute
]

{ #category : 'DSL' }
MQScopeQuery >> ofType: aFamixType [
	stopStrategy := MQScopeTypeStrategy scope: aFamixType.
	^ self execute
]

{ #category : 'DSL' }
MQScopeQuery >> recursively [
	isRecursive := true
]

{ #category : 'execution' }
MQScopeQuery >> scopeFor: aCollection [
	"We leave if the collection is empty to not check that everywhere.
	
	We split the collection to group them by class to optimize what follows."

	aCollection ifEmpty: [ ^ self result ].

	(self isUniform: aCollection) ifTrue: [ ^ self scopeForUniformElements: aCollection ].

	(aCollection groupedBy: #class) valuesDo: [ :entities | self scopeForUniformElements: entities ].

	^ self result
]

{ #category : 'execution' }
MQScopeQuery >> scopeForUniformElements: aCollection [
	"The code could be simpler but it is like this for performance reasons! Do not touch it lightly please."

	| selectors nextElements |
	(self stopStrategy selectMatchingElements: aCollection) ifEmpty: [ nextElements := aCollection ] ifNotEmpty: [ :selected |
			self result addAll: selected.
			nextElements := self isRecursive
				              ifTrue: [ aCollection ]
				              ifFalse: [
						              aCollection size = selected size "If we are not recursive and we select the full result we can quit."
							              ifTrue: [ ^ self result ]
							              ifFalse: [ aCollection \ selected ] ] ].

	until ifNotNil: [ nextElements := nextElements reject: [ :entity | until value: entity ] ].

	nextElements ifEmpty: [ ^ self result ].

	selectors := direction selectorsFor: nextElements first.

	nextElements do: [ :anEntity | "The content of this block could be much more readable with #do: but we do this solution for performances... We need this method to be really really performant."
		1 to: selectors size do: [ :ind | (anEntity perform: (selectors at: ind)) scopeForQuery: self ] ].
	^ self result
]

{ #category : 'accessing' }
MQScopeQuery >> stopStrategy [
	^ stopStrategy
]

{ #category : 'accessing' }
MQScopeQuery >> stopStrategy: anObject [
	stopStrategy := anObject
]

{ #category : 'accessing' }
MQScopeQuery >> until [
	^ until
]

{ #category : 'DSL' }
MQScopeQuery >> until: anObject [
	until := anObject
]

{ #category : 'DSL' }
MQScopeQuery >> withProperty: aSymbol [
	stopStrategy := MQScopePropertyStrategy property: aSymbol. 
	^ self execute
]
