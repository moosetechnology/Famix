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
| Relation | Origin | Opposite | Type | Comment |
|---|
| `accessor` | `FamixTAccess` | `accesses` | `FamixTWithAccesses` | Behavioural entity making the access to the variable. from-side of the association|

### Association target
| Relation | Origin | Opposite | Type | Comment |
|---|
| `variable` | `FamixTAccess` | `incomingAccesses` | `FamixTAccessible` | Variable accessed. to-side of the association|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `next` | `FamixTAssociation` | `previous` | `FamixTAssociation` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `previous` | `FamixTAssociation` | `next` | `FamixTAssociation` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isWrite` | `Boolean` | false | Write access|

"
Trait {
	#name : #FamixTAccess,
	#instVars : [
		'#accessor => FMOne type: #FamixTWithAccesses opposite: #accesses',
		'#isWrite => FMProperty defaultValue: false',
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

{ #category : #visitor }
FamixTAccess >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTAccess: self
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
