"
MooseQueryResult is the abstract class for holding the result of all Moose-Query queries.
By default MooseQueryResults are assumed to contain a collection of associations between the entity in receiver and all the element in storage at the exception of  MooseObjectQueryResult.

For more informations: https://moosequery.ferlicot.fr/

Instance Variables:
	storage	the elements resulting of the queries
	receiver	the receiver of the query, necessary for example when we want to do a withoutSelfLoop
"
Class {
	#name : #MooseQueryResult,
	#superclass : #Collection,
	#instVars : [
		'storage',
		'receiver'
	],
	#category : #'Moose-Query-Navigating'
}

{ #category : #'instance creation' }
MooseQueryResult class >> new: nElements [
	^ self new
		storage: (OrderedCollection new: nElements);
		yourself
]

{ #category : #'instance creation' }
MooseQueryResult class >> on: aSourceObject withAll: aCollection [

	^ self new
		receiver: aSourceObject;
		addAll: aCollection;
		yourself
]

{ #category : #comparing }
MooseQueryResult >> = aQueryResult [ 
	super = aQueryResult ifTrue: [^ true].
	self species == aQueryResult species ifFalse: [^ false].
	^ self storage = aQueryResult storage
]

{ #category : #adding }
MooseQueryResult >> add: newObject [
	"Include newObject as one of the receiver's elements. Answer newObject. 
	ArrayedCollections cannot respond to this message."

	^ storage add: newObject 
]

{ #category : #filtering }
MooseQueryResult >> allAtAnyScope: aCollectionOfFamixClasses [
	^ self executeScopeQuery: (MQScopeQuery recursivelyScopes: aCollectionOfFamixClasses direction: MQScopeUpStrategy)
]

{ #category : #filtering }
MooseQueryResult >> allAtScope: aClassFamix [
	^ self executeScopeQuery: (MQScopeQuery recursivelyScope: aClassFamix direction: MQScopeUpStrategy)
]

{ #category : #filtering }
MooseQueryResult >> allToAnyScope: aCollectionOfFamixClasses [
	^ self executeScopeQuery: (MQScopeQuery recursivelyScopes: aCollectionOfFamixClasses direction: MQScopeDownStrategy)
]

{ #category : #filtering }
MooseQueryResult >> allToScope: aClassFamix [
	^ self executeScopeQuery: (MQScopeQuery recursivelyScope: aClassFamix direction: MQScopeDownStrategy)
]

{ #category : #filtering }
MooseQueryResult >> allWithAnyScope: aCollectionOfFamixClasses [
	^ self executeScopeQuery: (MQScopeQuery recursivelyScopes: aCollectionOfFamixClasses direction: MQScopeAllStrategy)
]

{ #category : #filtering }
MooseQueryResult >> allWithScope: aClassFamix [
	^ self executeScopeQuery: (MQScopeQuery recursivelyScope: aClassFamix direction: MQScopeAllStrategy)
]

{ #category : #filtering }
MooseQueryResult >> atAnyScope: aCollectionOfFamixClasses [
	^ self executeScopeQuery: (MQScopeQuery scopes: aCollectionOfFamixClasses direction: MQScopeUpStrategy)
]

{ #category : #filtering }
MooseQueryResult >> atScope: aClassFamix [
	^ self executeScopeQuery: (MQScopeQuery scope: aClassFamix direction: MQScopeUpStrategy)
]

{ #category : #enumerating }
MooseQueryResult >> collect: aBlock [
	^ (super collect: aBlock)
		receiver: self receiver;
		yourself
]

{ #category : #enumerating }
MooseQueryResult >> do: aBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument."

	^ storage do: aBlock 
]

{ #category : #filtering }
MooseQueryResult >> executeScopeQuery: aQuery [ 
	^ self subclassResponsibility
]

{ #category : #initialization }
MooseQueryResult >> initialize [

	super initialize.
	self initialize: OrderedCollection new
]

{ #category : #initialization }
MooseQueryResult >> initialize: aCollectionForStorage [

	storage := aCollectionForStorage 
]

{ #category : #enumerating }
MooseQueryResult >> intersection: aCollection [
	| result |
	
	result := self class new.
	
	aCollection do: [ :each|
		((self includes: each) and: [(result includes: each) not])
				ifTrue: [ result add: each]].
		
	^ result
]

{ #category : #initialization }
MooseQueryResult >> newObjectResultWith: aCollection [

	^ MooseObjectQueryResult on: self receiver withAll: aCollection
]

{ #category : #filtering }
MooseQueryResult >> outOf: aFAMIXEntity [
	"Return the results which are out the entity as parameter."

	^ self subclassResponsibility
]

{ #category : #filtering }
MooseQueryResult >> outOfParentUsing: aFamixTrait [
	^ self outOf: (self receiver atScope: aFamixTrait) anyOne
]

{ #category : #accessing }
MooseQueryResult >> receiver [
	^ receiver
]

{ #category : #accessing }
MooseQueryResult >> receiver: anObject [
	receiver := anObject
]

{ #category : #enumerating }
MooseQueryResult >> reject: aBlock [
	^ (super reject: aBlock)
		receiver: self receiver;
		yourself
]

{ #category : #removing }
MooseQueryResult >> remove: oldObject ifAbsent: anExceptionBlock [
	"Remove oldObject from the receiver's elements. If several of the 
	elements are equal to oldObject, only one is removed. If no element is 
	equal to oldObject, answer the result of evaluating anExceptionBlock. 
	Otherwise, answer the argument, oldObject. ArrayedCollections cannot 
	respond to this message."

	^ storage remove: oldObject ifAbsent: anExceptionBlock 
]

{ #category : #enumerating }
MooseQueryResult >> select: aBlock [
	^ (super select: aBlock)
		receiver: self receiver;
		yourself
]

{ #category : #accessing }
MooseQueryResult >> storage [

	^ storage
]

{ #category : #accessing }
MooseQueryResult >> storage: aCollection [ 
	storage := aCollection
]

{ #category : #filtering }
MooseQueryResult >> toAnyScope: aCollectionOfFamixClasses [
	^ self executeScopeQuery: (MQScopeQuery scopes: aCollectionOfFamixClasses direction: MQScopeDownStrategy)
]

{ #category : #filtering }
MooseQueryResult >> toScope: aClassFamix [
	^ self executeScopeQuery: (MQScopeQuery scope: aClassFamix direction: MQScopeDownStrategy)
]

{ #category : #enumerating }
MooseQueryResult >> union: aCollection [

	| set |
	
	set := self asSet addAll: aCollection; yourself.
	
	 ^ self class on: (self receiver) withAll: set
]

{ #category : #filtering }
MooseQueryResult >> withAnyScope: aCollectionOfFamixClasses [
	^ self executeScopeQuery: (MQScopeQuery scopes: aCollectionOfFamixClasses direction: MQScopeAllStrategy)
]

{ #category : #filtering }
MooseQueryResult >> withScope: aClassFamix [
	^ self executeScopeQuery: (MQScopeQuery scope: aClassFamix direction: MQScopeAllStrategy)
]

{ #category : #filtering }
MooseQueryResult >> within: aFAMIXEntity [
	"Return the results which are in the entity as parameter."

	^ self subclassResponsibility
]

{ #category : #filtering }
MooseQueryResult >> withinParentUsing: aFamixTrait [
	^ self within: (self receiver atScope: aFamixTrait) anyOne
]

{ #category : #accessing }
MooseQueryResult >> withoutSelfLoops [
	^ self subclassResponsibility
]
