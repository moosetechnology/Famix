"
MooseObjectQueryResult hold the result of queries that return objects (e.g. opposite) as opposed by associations
"
Class {
	#name : #MooseObjectQueryResult,
	#superclass : #MooseQueryResult,
	#category : #'Moose-Query-Navigating'
}

{ #category : #'instance creation' }
MooseObjectQueryResult class >> withAll: aCollection [
	"Create a new collection containing all the elements from aCollection."

	^ self new
		addAll: aCollection;
		yourself
]

{ #category : #filtering }
MooseObjectQueryResult >> executeScopeQuery: aQuery [

	self storage do: [ :entity | 
		entity scopeForQuery: aQuery direction: aQuery direction ].
	^ self newObjectResultWith: aQuery result
]

{ #category : #evaluating }
MooseObjectQueryResult >> outOf: aFAMIXEntity [
	^ self newObjectResultWith: (storage reject: [ :obj | (obj allAtScope: aFAMIXEntity class) includes: aFAMIXEntity ])
]

{ #category : #'as yet unclassified' }
MooseObjectQueryResult >> relationsNamed: aSymbol [

	^ self newObjectResultWith: (self storage flatCollect: [ :entity | 
			   entity query relations named: aSymbol ])
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
