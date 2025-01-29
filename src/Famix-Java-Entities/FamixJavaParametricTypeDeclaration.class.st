"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `concretization` | `FamixTParametricAssociation` | `triggeringAssociation` | `FamixTConcretization` | The parameter concretizations associated with this association.|



"
Class {
	#name : #FamixJavaParametricTypeDeclaration,
	#superclass : #FamixJavaTypeDeclaration,
	#traits : 'FamixTParametricAssociation',
	#classTraits : 'FamixTParametricAssociation classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaParametricTypeDeclaration class >> annotation [

	<FMClass: #ParametricTypeDeclaration super: #FamixJavaTypeDeclaration>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]
