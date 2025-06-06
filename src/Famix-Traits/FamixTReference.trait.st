"
A FamixTReference entity is created whenever one manipulates an entity as a variable. For example:
- if a class is passed as a parameter to a method, or
- if a static method is invoked on a class.
- if a method is referenced as a method and not as method invocation

For example, in the following Java code
method a()
{B bObject = new B();  B.aStaticMethod(); }
There is only one reference which is created when the static method aStaticMethod is invoked on class variable B. In the declaration of B objects, the class B is the type of variable b but not a FamixTReference. And instantiation new B() is an invocation of the default constructor, and not a FamixTReference.


Note that FamixTReference was defined between two FamixTContainerEntity entities. So, it used to represent dependencies between container entities that are computed from the dependencies of contained entities. For example, references between two packages can be computed from dependencies between classes of the packages.

## Relations
======================

### Association source
| Relation | Origin | Opposite | Type | Comment |
|---|
| `referencer` | `FamixTReference` | `outgoingReferences` | `FamixTWithReferences` | Source entity making the reference. from-side of the association|

### Association target
| Relation | Origin | Opposite | Type | Comment |
|---|
| `referredEntity` | `FamixTReference` | `incomingReferences` | `FamixTReferenceable` | Target entity referenced. to-side of the association|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `next` | `FamixTAssociation` | `previous` | `FamixTAssociation` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `previous` | `FamixTAssociation` | `next` | `FamixTAssociation` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|



"
Trait {
	#name : #FamixTReference,
	#instVars : [
		'#referencer => FMOne type: #FamixTWithReferences opposite: #outgoingReferences',
		'#referredEntity => FMOne type: #FamixTReferenceable opposite: #incomingReferences'
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

{ #category : #visitor }
FamixTReference >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTReference: self
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
FamixTReference >> referredEntity [
	"Relation named: #referredEntity type: #FamixTReferenceable opposite: #incomingReferences"

	<generated>
	<FMComment: 'Target entity referenced. to-side of the association'>
	<target>
	^ referredEntity
]

{ #category : #accessing }
FamixTReference >> referredEntity: anObject [

	<generated>
	referredEntity := anObject
]
