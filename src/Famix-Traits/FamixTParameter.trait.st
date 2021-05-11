"
A Parameter represents one parameter in a behavioral (method, function, lamdba...) declaration.
	
For example in the following code we have two Parameters. One named ""a"" and another named ""b"". Both of them have ""int"" as declared type.

```java
// method with two parameters
int addNumbers(int a, int b) {
  // code
}
```

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
	^self
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
