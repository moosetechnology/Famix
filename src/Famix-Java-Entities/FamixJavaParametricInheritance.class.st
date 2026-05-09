"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `concretizations` | `FamixTParametricAssociation` | `triggeringAssociation` | `FamixTConcretization` | The parameter concretizations associated with this association.|



"
Class {
	#name : 'FamixJavaParametricInheritance',
	#superclass : 'FamixJavaInheritance',
	#traits : 'FamixTParametricAssociation',
	#classTraits : 'FamixTParametricAssociation classTrait',
	#category : 'Famix-Java-Entities-Entities',
	#package : 'Famix-Java-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixJavaParametricInheritance class >> annotation [

	<FMClass: #ParametricInheritance super: #FamixJavaInheritance>
	<package: #'Famix-Java-Entities'>
	<generated>
]

{ #category : 'visitor' }
FamixJavaParametricInheritance >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixJavaParametricInheritance: self
]
