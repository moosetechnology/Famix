"
FamixTImplicitVariable represents a variable defined by the compiler in a context, such as self, super, thisContext.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentBehaviouralEntity` | `FamixTImplicitVariable` | `implicitVariables` | `FamixTWithImplicitVariables` | The behaviour containing this implicit variable. belongsTo implementation|

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typing` | `FamixTTypedEntity` | `typedEntity` | `FamixTEntityTyping` | Association linking this entity to its declared type.|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingAccesses` | `FamixTAccessible` | `candidates` | `FamixTAccess` | All Famix accesses pointing to this structural entity|

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
	#name : 'FamixTImplicitVariable',
	#instVars : [
		'#parentBehaviouralEntity => FMOne type: #FamixTWithImplicitVariables opposite: #implicitVariables'
	],
	#traits : 'FamixTStructuralEntity',
	#classTraits : 'FamixTStructuralEntity classTrait',
	#category : 'Famix-Traits-ImplicitVariable',
	#package : 'Famix-Traits',
	#tag : 'ImplicitVariable'
}

{ #category : 'meta' }
FamixTImplicitVariable classSide >> annotation [

	<FMClass: #TImplicitVariable super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : 'visitor' }
FamixTImplicitVariable >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTImplicitVariable: self
]

{ #category : 'accessing' }
FamixTImplicitVariable >> declaredType [
	"If we have a declared type, we return it. Else, we check if the implicit variable is self or super to determine the declared type."

	self typing ifNotNil: [ :t | t declaredType ifNotNil: [ :type | ^ type ] ].

	[
		self isSelf ifTrue: [ ^ (self query containers ofType: FamixTClass) anyOne ].

		self isSuper ifTrue: [ ^ (self query containers ofType: FamixTClass) anyOne superclass ] ]
		on: Error
		do: [ "Nothing. If we cannot determine the type, just return nil." ].

	^ nil
]

{ #category : 'testing' }
FamixTImplicitVariable >> isImplicitVariable [

	<generated>
	^ true
]

{ #category : 'testing' }
FamixTImplicitVariable >> isSelf [

	^ self shouldBeImplemented
]

{ #category : 'testing' }
FamixTImplicitVariable >> isSuper [

	^ self name = 'super'
]

{ #category : 'accessing' }
FamixTImplicitVariable >> parentBehaviouralEntity [
	"Relation named: #parentBehaviouralEntity type: #FamixTWithImplicitVariables opposite: #implicitVariables"

	<generated>
	<FMComment: 'The behaviour containing this implicit variable. belongsTo implementation'>
	<container>
	^ parentBehaviouralEntity
]

{ #category : 'accessing' }
FamixTImplicitVariable >> parentBehaviouralEntity: anObject [

	parentBehaviouralEntity := anObject.
	self resetMooseName.
	

]
