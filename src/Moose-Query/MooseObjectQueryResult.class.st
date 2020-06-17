"
MooseObjectQueryResult hold the result of queries that return objects (e.g. opposite) as opposed by associations
"
Class {
	#name : #MooseObjectQueryResult,
	#superclass : #MooseQueryResult,
	#category : #'Moose-Query-Results'
}

{ #category : #'instance creation' }
MooseObjectQueryResult class >> withAll: aCollection [
	"Create a new collection containing all the elements from aCollection."

	^ self new
		addAll: aCollection;
		yourself
]

{ #category : #filtering }
MooseObjectQueryResult >> allAtAnyScope: aCollectionOfFamixClasses [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :entity | entity allAtAnyScope: aCollectionOfFamixClasses in: res ]) asSet
]

{ #category : #filtering }
MooseObjectQueryResult >> allAtScope: aClassFamix [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :entity | entity allAtScope: aClassFamix in: res ]) asSet
]

{ #category : #filtering }
MooseObjectQueryResult >> allToAnyScope: aCollectionOfFamixClasses [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :entity | entity allToAnyScope: aCollectionOfFamixClasses in: res ]) asSet
]

{ #category : #filtering }
MooseObjectQueryResult >> allToScope: aClassFamix [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :entity | entity allToScope: aClassFamix in: res ]) asSet
]

{ #category : #filtering }
MooseObjectQueryResult >> allWithAnyScope: aCollectionOfFamixClasses [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :entity | entity allWithAnyScope: aCollectionOfFamixClasses in: res ]) asSet
]

{ #category : #filtering }
MooseObjectQueryResult >> allWithScope: aClassFamix [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :entity | entity allWithScope: aClassFamix in: res ]) asSet
]

{ #category : #filtering }
MooseObjectQueryResult >> atAnyScope: aCollectionOfFamixClasses [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :entity | entity atAnyScope: aCollectionOfFamixClasses in: res ]) asSet
]

{ #category : #filtering }
MooseObjectQueryResult >> atScope: aClassFamix [
	^ self
		newObjectResultWith:
			(self storage
				inject: OrderedCollection new
				into: [ :res :entity | MooseQueryCurrentContext value: (MooseQueryContext scope: aClassFamix) during: [ entity atScopeIn: res ] ]) asSet
]

{ #category : #evaluating }
MooseObjectQueryResult >> outOf: aFAMIXEntity [
	^ self newObjectResultWith: (storage reject: [ :obj | (obj allAtScope: aFAMIXEntity class) includes: aFAMIXEntity ])
]

{ #category : #filtering }
MooseObjectQueryResult >> toAnyScope: aCollectionOfFamixClasses [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :entity | entity toAnyScope: aCollectionOfFamixClasses in: res ]) asSet
]

{ #category : #filtering }
MooseObjectQueryResult >> toScope: aClassFamix [
	^ self
		newObjectResultWith:
			(self storage
				inject: OrderedCollection new
				into: [ :res :entity | MooseQueryCurrentContext value: (MooseQueryContext scope: aClassFamix) during: [ entity toScopeIn: res ] ]) asSet
]

{ #category : #filtering }
MooseObjectQueryResult >> withAnyScope: aCollectionOfFamixClasses [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :entity | entity withAnyScope: aCollectionOfFamixClasses in: res ]) asSet
]

{ #category : #filtering }
MooseObjectQueryResult >> withScope: aClassFamix [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :entity | entity withScope: aClassFamix in: res ]) asSet
]

{ #category : #evaluating }
MooseObjectQueryResult >> within: aFAMIXEntity [
	^ self newObjectResultWith: (storage select: [ :obj | (obj allAtScope: aFAMIXEntity class) includes: aFAMIXEntity ])
]

{ #category : #filtering }
MooseObjectQueryResult >> withoutSelfLoops [
	"exclude objects that match the receiver (modulo the scope)"

	"We use a cache for the parents selector for performances reasons. It might be really long to perform the #withoutSelfLoops thus we need to speed it up a maximum.
	
	[ (model allUsing: TEntityMetaLevelDependency) collect: [ :e | e  queryIncomingDependencies withoutSelfLoops ] ] timeToRun."

	| parentSelectorsCache |
	parentSelectorsCache := SmallDictionary new.
	^ self reject: [ :obj | obj isIncludedIn: self receiver parentSelectorsCache: parentSelectorsCache ]
]
