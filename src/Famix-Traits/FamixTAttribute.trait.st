"
FamixTAttribute represents a field of a class. It is an attribute of the parent type.


## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentType` | `FamixTAttribute` | `attributes` | `FamixTWithAttributes` | Type declaring the attribute. belongsTo implementation|

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typing` | `FamixTTypedEntity` | `typedEntity` | `FamixTEntityTyping` | Association linking this entity to its declared type.|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingAccesses` | `FamixTAccessible` | `variable` | `FamixTAccess` | All Famix accesses pointing to this structural entity|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Trait {
	#name : #FamixTAttribute,
	#instVars : [
		'#parentType => FMOne type: #FamixTWithAttributes opposite: #attributes'
	],
	#traits : 'FamixTStructuralEntity',
	#classTraits : 'FamixTStructuralEntity classTrait',
	#category : #'Famix-Traits-Attribute'
}

{ #category : #meta }
FamixTAttribute classSide >> annotation [

	<FMClass: #TAttribute super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixTAttribute >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTAttribute: self
]

{ #category : #private }
FamixTAttribute >> accessorMethods [

	^ (self incomingAccesses collectAsSet: [ :each | each source ])
		  select: [ :each | each isGetter or: [ each isSetter ] ]
]

{ #category : #metrics }
FamixTAttribute >> hierarchyNestingLevel [
	<FMProperty: #hierarchyNestingLevel type: #Number>
	<derived>
	<FMComment: 'Attribute hierarchy nesting level'>
		
	^self
		lookUpPropertyNamed: #hierarchyNestingLevel
		computedAs: [self parentType hierarchyNestingLevel]
]

{ #category : #metrics }
FamixTAttribute >> hierarchyNestingLevel: aNumber [
	self cacheAt: #hierarchyNestingLevel put: aNumber
]

{ #category : #testing }
FamixTAttribute >> isAttribute [

	<generated>
	^ true
]

{ #category : #testing }
FamixTAttribute >> isDead [

	"If it is only accessed by accessors and its accessors are not called"
	^ (self incomingAccesses collectAsSet: #source) = self accessorMethods
		  and: [ self accessorMethods allSatisfy: #isDead ]
]

{ #category : #printing }
FamixTAttribute >> mooseNameOn: aStream [
	self parentType
		ifNotNil: [ :parent | 
			parent mooseNameOn: aStream.
			aStream nextPut: $. ].
	self name ifNotNil: [ aStream nextPutAll: self name ]
]

{ #category : #accessing }
FamixTAttribute >> parentType [
	"Relation named: #parentType type: #FamixTWithAttributes opposite: #attributes"

	<generated>
	<FMComment: 'Type declaring the attribute. belongsTo implementation'>
	<container>
	^ parentType
]

{ #category : #accessing }
FamixTAttribute >> parentType: anObject [

	parentType := anObject.
	self resetMooseName.

]

{ #category : #navigation }
FamixTAttribute >> parentTypeGroup [
	<generated>
	<navigation: 'ParentType'>
	^ MooseSpecializedGroup with: self parentType
]

{ #category : #printing }
FamixTAttribute >> printOn: aStream [
	self parentType
		ifNotNil: [ :parent | 
			aStream
				nextPutAll: parent name;
				nextPut: $. ].
	self name ifNotNil: [ aStream nextPutAll: self name ].
	aStream nextPutAll: ' (Attribute)'
]
