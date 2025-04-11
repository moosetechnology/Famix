"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `concretizations` | `FamixTParametricAssociation` | `triggeringAssociation` | `FamixTConcretization` | The parameter concretizations associated with this association.|



"
Class {
	#name : #FamixJavaParametricInvocation,
	#superclass : #FamixJavaInvocation,
	#traits : 'FamixTParametricAssociation',
	#classTraits : 'FamixTParametricAssociation classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaParametricInvocation class >> annotation [

	<FMClass: #ParametricInvocation super: #FamixJavaInvocation>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]
