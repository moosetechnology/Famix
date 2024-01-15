"
FamixTMethod represents a behaviour in an object-oriented language.

A FamixTMethod is always contained in a parentType.

## Relations
======================

### Parents
- Relation: #parentType Type: #FamixTWithMethods Opposite: #methods Comment: Type declaring the method. It provides the implementation for belongsTo.
### Children
- Relation: #parameters Type: #FamixTParameter Opposite: #parentBehaviouralEntity Comment: List of formal parameters declared by this behaviour.
- Relation: #implicitVariables Type: #FamixTImplicitVariable Opposite: #parentBehaviouralEntity Comment: Implicit variables used locally by this behaviour.
- Relation: #localVariables Type: #FamixTLocalVariable Opposite: #parentBehaviouralEntity Comment: Variables locally defined by this behaviour.
### Outgoing dependencies
- Relation: #outgoingReferences Type: #FamixTReference Opposite: #referencer Comment: References from this entity to other entities.
- Relation: #outgoingInvocations Type: #FamixTInvocation Opposite: #sender Comment: Outgoing invocations sent by this behaviour.
- Relation: #accesses Type: #FamixTAccess Opposite: #accessor Comment: Accesses to variables made by this behaviour.
### Incomming dependencies
- Relation: #incomingInvocations Type: #FamixTInvocation Opposite: #candidates Comment: Incoming invocations from other behaviours computed by the candidate operator.
### Other
- Relation: #sourceAnchor Type: #FamixTSourceAnchor Opposite: #element Comment: SourceAnchor entity linking to the original source code for this entity
- Relation: #declaredType Type: #FamixTType Opposite: #typedEntities Comment: Type of the entity, if any

## Properties
======================

- Named: #signature Type: String Comment: Signature of the message being sent
- Named: #isStub Type: Boolean Comment: Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.
- Named: #name Type: String Comment: Basic name of the entity, not full reference.

"
Trait {
	#name : #FamixTMethod,
	#instVars : [
		'#parentType => FMOne type: #FamixTWithMethods opposite: #methods'
	],
	#traits : 'FamixTHasSignature + FamixTInvocable + FamixTMethodMetrics + FamixTNamedEntity + FamixTTypedEntity + FamixTWithImplicitVariables + FamixTWithLocalVariables + FamixTWithParameters + FamixTWithStatements + TEntityMetaLevelDependency',
	#classTraits : 'FamixTHasSignature classTrait + FamixTInvocable classTrait + FamixTMethodMetrics classTrait + FamixTNamedEntity classTrait + FamixTTypedEntity classTrait + FamixTWithImplicitVariables classTrait + FamixTWithLocalVariables classTrait + FamixTWithParameters classTrait + FamixTWithStatements classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-Traits-Behavioral'
}

{ #category : #meta }
FamixTMethod classSide >> annotation [

	<FMClass: #TMethod super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #groups }
FamixTMethod classSide >> annotationFamixMethodGroup [
	<generated>
	<mooseGroup>
	^ FamixMethodGroup
]

{ #category : #testing }
FamixTMethod >> isDelegating [

	^ (self outgoingInvocations flatCollect: #target) anySatisfy: [ :each | 
		  each signature == self signature and: [ 
			  (each isInSameClassAs: self) not ] ] 
]

{ #category : #testing }
FamixTMethod >> isExtending [

	^ (self outgoingInvocations reject: [ :each | each receiver isNil ]) 
		  anySatisfy: [ :each | 
			  each receiver name = 'super' and: [ 
				  (each candidates collect: #signature) includes: self signature ] ]
]

{ #category : #testing }
FamixTMethod >> isInSameClassAs: aMethod [

	^ aMethod parentType == self parentType
]

{ #category : #testing }
FamixTMethod >> isMethod [

	<generated>
	^ true
]

{ #category : #printing }
FamixTMethod >> mooseNameOn: stream [
	self parentType
		ifNotNil: [ :parent | 
			parent mooseNameOn: stream.
			stream nextPut: $. ].
	self signature
		ifNotNil: [ :aSignature | stream nextPutAll: aSignature ]
		ifNil: [ self name ifNotNil: [ :aName | stream nextPutAll: aName ] ]
]

{ #category : #accessing }
FamixTMethod >> parentType [
	"Relation named: #parentType type: #FamixTWithMethods opposite: #methods"

	<generated>
	<FMComment: 'Type declaring the method. It provides the implementation for belongsTo.'>
	<container>
	^ parentType
]

{ #category : #accessing }
FamixTMethod >> parentType: anObject [

	parentType := anObject.
	self resetMooseName.

]

{ #category : #navigation }
FamixTMethod >> parentTypeGroup [
	<generated>
	<navigation: 'ParentType'>
	^ MooseSpecializedGroup with: self parentType
]

{ #category : #testing }
FamixTMethod >> parentTypeIsStub [

	^ self parentType ifNotNil: [ :e | e isStub ] ifNil: [ true ]
]
