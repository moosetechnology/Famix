"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `concretizations` | `FamixTParametricAssociation` | `triggeringAssociation` | `FamixTConcretization` | The parameter concretizations associated with this association.|



"
Class {
	#name : #FamixJavaParametricReference,
	#superclass : #FamixJavaReference,
	#traits : 'FamixTParametricAssociation',
	#classTraits : 'FamixTParametricAssociation classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaParametricReference class >> annotation [

	<FMClass: #ParametricReference super: #FamixJavaReference>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #'*Famix-Java-Visitor' }
FamixJavaParametricReference >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixJavaParametricReference: self
]
