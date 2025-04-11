"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `concretizations` | `FamixTParametricAssociation` | `triggeringAssociation` | `FamixTConcretization` | The parameter concretizations associated with this association.|



"
Class {
	#name : #FamixJavaParametricImplementation,
	#superclass : #FamixJavaImplementation,
	#traits : 'FamixTParametricAssociation',
	#classTraits : 'FamixTParametricAssociation classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaParametricImplementation class >> annotation [

	<FMClass: #ParametricImplementation super: #FamixJavaImplementation>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]
