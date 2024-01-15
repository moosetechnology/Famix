"
A FamixTReference entity is created whenever one manipulates a class name as a variable. For example:
(i) if the class is passed as a parameter to a method, or
(ii) if a static method is invoked on a class.

For example, in the following Java code
method a()
{B bObject = new B();  B.aStaticMethod(); }
There is only one reference which is created when the static method aStaticMethod is invoked on class variable B. In the declaration of B objects, the class B is the type of variable b but not a FamixTReference. And instantiation new B() is an invocation of the default constructor, and not a FamixTReference.


Note that FamixTReference was defined between two FamixTContainerEntity entities. So, it used to represent dependencies between container entities that are computed from the dependencies of contained entities. For example, references between two packages can be computed from dependencies between classes of the packages.

## Relations
======================

### Association source
- Relation: #referencer Type: #FamixTWithReferences Opposite: #outgoingReferences Comment: Source entity making the reference. from-side of the association
### Association target
- Relation: #referredType Type: #FamixTReferenceable Opposite: #incomingReferences Comment: Target entity referenced. to-side of the association
### Other
- Relation: #next Type: #FamixTAssociation Opposite: #previous Comment: Next association in an ordered collection of associations. Currently not supported by the Moose importer
- Relation: #previous Type: #FamixTAssociation Opposite: #next Comment: Previous association in an ordered collection of associations. Currently not supported by the Moose importer
- Relation: #sourceAnchor Type: #FamixTSourceAnchor Opposite: #element Comment: SourceAnchor entity linking to the original source code for this entity

## Properties
======================

- Named: #isStub Type: Boolean Comment: Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.

"
Trait {
	#name : #FamixTReference,
	#instVars : [
		'#referencer => FMOne type: #FamixTWithReferences opposite: #outgoingReferences',
		'#referredType => FMOne type: #FamixTReferenceable opposite: #incomingReferences'
	],
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#category : #'Famix-Traits-Reference'
}

{ #category : #meta }
FamixTReference classSide >> annotation [

	<FMClass: #TReference super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #'instance creation' }
FamixTReference classSide >> source: source target: target [
	^ self new source: source; target: target
]

{ #category : #testing }
FamixTReference >> isReference [

	<generated>
	^ true
]

{ #category : #accessing }
FamixTReference >> referencer [
	"Relation named: #referencer type: #FamixTWithReferences opposite: #outgoingReferences"

	<generated>
	<FMComment: 'Source entity making the reference. from-side of the association'>
	<source>
	^ referencer
]

{ #category : #accessing }
FamixTReference >> referencer: anObject [

	<generated>
	referencer := anObject
]

{ #category : #accessing }
FamixTReference >> referredType [
	"Relation named: #referredType type: #FamixTReferenceable opposite: #incomingReferences"

	<generated>
	<FMComment: 'Target entity referenced. to-side of the association'>
	<target>
	^ referredType
]

{ #category : #accessing }
FamixTReference >> referredType: anObject [

	<generated>
	referredType := anObject
]
