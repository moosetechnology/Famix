"
## Relations
======================

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingAccesses` | `FamixTAccessible` | `candidates` | `FamixTAccess` | All Famix accesses pointing to this structural entity|



"
Trait {
	#name : 'FamixTAccessible',
	#instVars : [
		'#incomingAccesses => FMMany type: #FamixTAccess opposite: #candidates'
	],
	#category : 'Famix-Traits-Access',
	#package : 'Famix-Traits',
	#tag : 'Access'
}

{ #category : 'meta' }
FamixTAccessible classSide >> annotation [

	<FMClass: #TAccessible super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'visitor' }
FamixTAccessible >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTAccessible: self
]

{ #category : 'accessing' }
FamixTAccessible >> accessingClasses [

	^(self accessingMethods collectAsSet: [:each | each belongsTo]) asOrderedCollection
]

{ #category : 'accessing' }
FamixTAccessible >> accessingMethods [

	^ self incomingAccesses collectAsSet: [:anAccess | anAccess accessor].

]

{ #category : 'accessing' }
FamixTAccessible >> accessors [
	<FMProperty: #accessors type: #FamixTWithAccesses>
	<multivalued>
	<derived>
	^ (self incomingAccesses collectAsSet: [ :each | each accessor ]) asMooseGroup
]

{ #category : 'adding' }
FamixTAccessible >> addIncomingAccess: anAccess [
	incomingAccesses add: anAccess
]

{ #category : 'accessing' }
FamixTAccessible >> globalAccesses [
	| attrclass globalAccesses |
	attrclass := self belongsTo.
	globalAccesses := Set new.
	self
		incomingAccesses do:
			[:anAccess | 
			| ent |
			ent := anAccess accessor.
			ent belongsTo = attrclass ifFalse: [globalAccesses add: anAccess]].
	^globalAccesses
]

{ #category : 'accessing' }
FamixTAccessible >> incomingAccesses [
	"Relation named: #incomingAccesses type: #FamixTAccess opposite: #candidates"

	<generated>
	<FMComment: 'All Famix accesses pointing to this structural entity'>
	^ incomingAccesses
]

{ #category : 'accessing' }
FamixTAccessible >> incomingAccesses: anObject [

	<generated>
	incomingAccesses value: anObject
]

{ #category : 'accessing' }
FamixTAccessible >> localAccesses [
	| attrclass localAccesses |
	attrclass := self belongsTo.
	localAccesses := Set new.
	self
		incomingAccesses do:
			[:anAccess | 
			| ent |
			ent := anAccess accessor.
			ent belongsTo = attrclass ifTrue: [localAccesses add: anAccess]].
	^localAccesses
]

{ #category : 'accessing' }
FamixTAccessible >> numberOfAccesses [

	<FMProperty: #numberOfAccesses type: #Number>
	<derived>
	<FMComment: 'The number of accesses of an attribute.'>
	^ self cacheAt: #numberOfAccesses ifAbsent: [ self incomingAccesses size ]
]

{ #category : 'accessing' }
FamixTAccessible >> numberOfAccessingClasses [

	<FMProperty: #numberOfAccessingClasses type: #Number>
	<derived>
	<FMComment: 'The number of classes from which at least one method accesses an attribute.'>
	^ self cacheAt: #numberOfAccessingClasses ifAbsent: [ self accessingClasses size ]
]

{ #category : 'accessing' }
FamixTAccessible >> numberOfAccessingMethods [

	<FMProperty: #numberOfAccessingMethods type: #Number>
	<derived>
	<FMComment: 'The number of methods accessing an attribute.'>
	^ self cacheAt: #numberOfAccessingMethods ifAbsent: [ self accessingMethods size ]
]

{ #category : 'accessing' }
FamixTAccessible >> numberOfGlobalAccesses [

	<FMProperty: #numberOfGlobalAccesses type: #Number>
	<derived>
	<FMComment: 'The number of accesses to an attribute from outside the class defining the attribute.'>
	^ self cacheAt: #numberOfGlobalAccesses ifAbsent: [ self globalAccesses size ]
]

{ #category : 'accessing' }
FamixTAccessible >> numberOfLocalAccesses [

	<FMProperty: #numberOfLocalAccesses type: #Number>
	<derived>
	<FMComment: 'The number of accesses to an attribute from inside the class defining the attribute.'>
	^ self cacheAt: #numberOfLocalAccesses ifAbsent: [ self localAccesses size ]
]

{ #category : 'accessing' }
FamixTAccessible >> readAccesses [
	
	^self incomingAccesses select: [:each | each isRead]
]
