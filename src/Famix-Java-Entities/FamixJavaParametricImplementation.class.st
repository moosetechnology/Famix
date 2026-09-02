"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `concretizations` | `FamixTParametricAssociation` | `triggeringAssociation` | `FamixTConcretization` | The parameter concretizations associated with this association.|



"
Class {
	#name : 'FamixJavaParametricImplementation',
	#superclass : 'FamixJavaImplementation',
	#traits : 'FamixTParametricAssociation',
	#classTraits : 'FamixTParametricAssociation classTrait',
	#category : 'Famix-Java-Entities-Entities',
	#package : 'Famix-Java-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixJavaParametricImplementation class >> annotation [

	<ignoreForCoverage>
	<FMClass: #ParametricImplementation super: #FamixJavaImplementation>
	<package: #'Famix-Java-Entities'>
	<generated>
]
