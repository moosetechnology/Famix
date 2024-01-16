"
FamixTAccess represents an access to a variable by a behavioural entity (for example, a function or a method). 

For example if the method foo accesses the instance variable x, there is an access with the following information:
	(i) From: aFamixTMethod (foo)
	(ii) To: aFamixTAttribute (x)
	
aFamixTMethod (foo) can be accessed using the message accessor (and from)
aFamixTAttribute (x) can be accessed using the message variable (and to). 

Furthermore it can be tagged as read or write using isWrite: aBoolean.

For each access in the source code, there is one famix access created even if it is from the same behavioral entity towards the same variable.

## Relations
======================

### Association source
| Relation | Type | Opposite | Comment |
| `accessor` | `FamixTWithAccesses` | `accesses` | Behavioural entity making the access to the variable. from-side of the association|

### Association target
| Relation | Type | Opposite | Comment |
| `variable` | `FamixTAccessible` | `incomingAccesses` | Variable accessed. to-side of the association|

### Other
| Relation | Type | Opposite | Comment |
| `next` | `FamixTAssociation` | `previous` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `previous` | `FamixTAssociation` | `next` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `sourceAnchor` | `FamixTSourceAnchor` | `element` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Comment |
| `isStub` | Boolean | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `isWrite` | Boolean | Write access|

"
Trait {
	#name : #FamixTAccess,
	#instVars : [
		'#accessor => FMOne type: #FamixTWithAccesses opposite: #accesses',
		'#isWrite => FMProperty',
		'#variable => FMOne type: #FamixTAccessible opposite: #incomingAccesses'
	],
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#category : #'Famix-Traits-Access'
}

{ #category : #meta }
FamixTAccess classSide >> annotation [

	<FMClass: #TAccess super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixTAccess >> accessor [
	"Relation named: #accessor type: #FamixTWithAccesses opposite: #accesses"

	<generated>
	<FMComment: 'Behavioural entity making the access to the variable. from-side of the association'>
	<source>
	^ accessor
]

{ #category : #accessing }
FamixTAccess >> accessor: anObject [

	<generated>
	accessor := anObject
]

{ #category : #printing }
FamixTAccess >> displayStringOn: aStream [

	variable displayStringOn: aStream.
	aStream << ' accessed in '.
	accessor displayStringOn: aStream
]

{ #category : #testing }
FamixTAccess >> isAccess [

	<generated>
	^ true
]

{ #category : #accessing }
FamixTAccess >> isRead [
	<FMProperty: #isRead type: #Boolean>
	<derived>
	<FMComment: 'Read access'>
	^ isWrite ifNil: [ false ] ifNotNil: [ isWrite not ]
]

{ #category : #accessing }
FamixTAccess >> isReadWriteUnknown [
	<FMProperty: #isReadWriteUnknown type: #Boolean> <derived>
	<FMComment: ''>
	
	^ isWrite isNil
]

{ #category : #accessing }
FamixTAccess >> isWrite [

	<FMProperty: #isWrite type: #Boolean>
	<FMComment: 'Write access'>
	^ isWrite ifNil: [ false ]
]

{ #category : #accessing }
FamixTAccess >> isWrite: anObject [
	<generated>
	isWrite := anObject
]

{ #category : #printing }
FamixTAccess >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' (Access)'
]

{ #category : #accessing }
FamixTAccess >> variable [
	"Relation named: #variable type: #FamixTAccessible opposite: #incomingAccesses"

	<generated>
	<FMComment: 'Variable accessed. to-side of the association'>
	<target>
	^ variable
]

{ #category : #accessing }
FamixTAccess >> variable: anObject [

	<generated>
	variable := anObject
]
