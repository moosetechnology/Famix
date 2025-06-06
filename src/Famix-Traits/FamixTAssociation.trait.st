"
FamixTAssociation is an abstract superclass for relationships between Famix named entities. It defines a polymorphic API refined by subclasses: essentially from, to, next and previous.

From and To properties are abstract at this level, but specific implementations can have multiple ends and properties. 
For example, FamixTInheritance has:
	(i) From mapped to the subclass;
	(ii) To mapped to the superclass.
	
To adapt your code to MooseQuery, you have also to add the <source> and <target> pragmas in the selectors definition for each class inheriting FamixTAssociation

Next and Previous properties provide an order of the appearence of these associations in code. The order is calculated within a particular relationship for example, method invocation order within a calling method (from).
For example in java, the following code
 method a() { b(); c(); }
will produce two invocation associations first from method a to method b, and second from method a to method c. These associations are bound together and can be navigated with previous and next.





## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `next` | `FamixTAssociation` | `previous` | `FamixTAssociation` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `previous` | `FamixTAssociation` | `next` | `FamixTAssociation` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|



"
Trait {
	#name : #FamixTAssociation,
	#instVars : [
		'#next => FMOne type: #FamixTAssociation opposite: #previous',
		'#previous => FMOne type: #FamixTAssociation opposite: #next'
	],
	#traits : 'FamixTSourceEntity + TAssociationMetaLevelDependency',
	#classTraits : 'FamixTSourceEntity classTrait + TAssociationMetaLevelDependency classTrait',
	#category : #'Famix-Traits-Association'
}

{ #category : #meta }
FamixTAssociation classSide >> annotation [

	<FMClass: #TAssociation super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #'instance creation' }
FamixTAssociation classSide >> source: anEntity target: anotherEntity [
	^ self new
		source: anEntity;
		target: anotherEntity;
		yourself
]

{ #category : #'instance creation' }
FamixTAssociation classSide >> source: anEntity target: anotherEntity model: aMooseModel [
	^ (self source: anEntity target: anotherEntity)
		mooseModel: aMooseModel;
		yourself
]

{ #category : #visitor }
FamixTAssociation >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTAssociation: self
]

{ #category : #accessing }
FamixTAssociation >> allTargets [
	"Since #target can return an entity or a collection, I ensure we always get a collection."

	| tempTarget |
	tempTarget := self target.
	^ tempTarget isCollection
		  ifTrue: [ tempTarget ]
		  ifFalse: [ OrderedCollection with: tempTarget ]
]

{ #category : #converting }
FamixTAssociation >> asAssociationFrom: anEntity [
	^ self
]

{ #category : #converting }
FamixTAssociation >> asAssociationTo: anEntity [
	^ self
]

{ #category : #printing }
FamixTAssociation >> displayFullStringOn: aStream [

	self source displayFullStringOn: aStream.
	aStream nextPutAll: ' -> '.
	self target displayFullStringOn: aStream
]

{ #category : #printing }
FamixTAssociation >> displayStringOn: aStream [

	self source displayStringOn: aStream.
	aStream nextPutAll: ' -> '.
	self target displayStringOn: aStream
]

{ #category : #testing }
FamixTAssociation >> isAssociation [

	<generated>
	^ true
]

{ #category : #accessing }
FamixTAssociation >> next [
	"Relation named: #next type: #FamixTAssociation opposite: #previous"

	<generated>
	<FMComment: 'Next association in an ordered collection of associations. Currently not supported by the Moose importer'>
	<derived>
	^ next
]

{ #category : #accessing }
FamixTAssociation >> next: anObject [

	<generated>
	next := anObject
]

{ #category : #accessing }
FamixTAssociation >> previous [
	"Relation named: #previous type: #FamixTAssociation opposite: #next"

	<generated>
	<FMComment: 'Previous association in an ordered collection of associations. Currently not supported by the Moose importer'>
	^ previous
]

{ #category : #accessing }
FamixTAssociation >> previous: anObject [

	<generated>
	previous := anObject
]

{ #category : #accessing }
FamixTAssociation >> source [
	^ self sourceSelector value: self
]

{ #category : #accessing }
FamixTAssociation >> source: aSource [
	self perform: (self sourceSelector , ':') with: aSource
]

{ #category : #accessing }
FamixTAssociation >> target [
	^ self targetSelector value: self
]

{ #category : #accessing }
FamixTAssociation >> target: aTarget [
	self perform: (self targetSelector , ':') with: aTarget
]
