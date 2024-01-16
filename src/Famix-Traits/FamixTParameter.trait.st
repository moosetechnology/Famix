"
A Parameter represents one parameter in a behavioral (method, function, lamdba...) declaration.
	
For example in the following code we have two Parameters. One named ""a"" and another named ""b"". Both of them have ""int"" as declared type.

```java
// method with two parameters
int addNumbers(int a, int b) {
  // code
}
```


## Relations
======================

### Parents
- Relation: #parentBehaviouralEntity Type: #FamixTWithParameters Opposite: #parameters Comment: Behavioural entity containing this parameter. belongsTo implementation
### Incoming dependencies
- Relation: #incomingAccesses Type: #FamixTAccess Opposite: #variable Comment: All Famix accesses pointing to this structural entity
### Other
- Relation: #declaredType Type: #FamixTType Opposite: #typedEntities Comment: Type of the entity, if any
- Relation: #sourceAnchor Type: #FamixTSourceAnchor Opposite: #element Comment: SourceAnchor entity linking to the original source code for this entity

## Properties
======================

- Named: #isStub Type: Boolean Comment: Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.
- Named: #name Type: String Comment: Basic name of the entity, not full reference.

"
Trait {
	#name : #FamixTParameter,
	#instVars : [
		'#parentBehaviouralEntity => FMOne type: #FamixTWithParameters opposite: #parameters'
	],
	#traits : 'FamixTStructuralEntity',
	#classTraits : 'FamixTStructuralEntity classTrait',
	#category : #'Famix-Traits-Parameter'
}

{ #category : #meta }
FamixTParameter classSide >> annotation [

	<FMClass: #TParameter super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #printing }
FamixTParameter >> displayStringOn: aStream [

	self name ifNotNil: [ :n | aStream << n << ' in ' ].
	self parentBehaviouralEntity ifNotNil: [ :pbe | 
		pbe displayStringOn: aStream ]
]

{ #category : #accessing }
FamixTParameter >> parentBehaviouralEntity [
	"Relation named: #parentBehaviouralEntity type: #FamixTWithParameters opposite: #parameters"

	<generated>
	<FMComment: 'Behavioural entity containing this parameter. belongsTo implementation'>
	<container>
	^ parentBehaviouralEntity
]

{ #category : #accessing }
FamixTParameter >> parentBehaviouralEntity: anObject [

	parentBehaviouralEntity := anObject.
	self resetMooseName.

]

{ #category : #navigation }
FamixTParameter >> parentBehaviouralEntityGroup [
	<generated>
	<navigation: 'ParentBehaviouralEntity'>
	^ MooseSpecializedGroup with: self parentBehaviouralEntity
]
