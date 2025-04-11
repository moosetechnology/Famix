"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `concretizations` | `FamixTParametricAssociation` | `triggeringAssociation` | `FamixTConcretization` | The parameter concretizations associated with this association.|



"
Class {
	#name : #FamixJavaParametricEntityTyping,
	#superclass : #FamixJavaEntityTyping,
	#traits : 'FamixTParametricAssociation',
	#classTraits : 'FamixTParametricAssociation classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaParametricEntityTyping class >> annotation [

	<FMClass: #ParametricEntityTyping super: #FamixJavaEntityTyping>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]
