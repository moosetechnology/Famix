"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
| `element` | `FamixTSourceAnchor` | `sourceAnchor` | `FamixTSourceEntity` | Enable the accessibility to the famix entity that this class is a source pointer for|


## Properties
======================

| Name | Type | Default value | Comment |
| `fileAnchors` | `FamixTFileAnchor` | nil | All source code definition files|

"
Class {
	#name : #FamixTest1MultipleFileAnchor,
	#superclass : #FamixTest1SourceAnchor,
	#traits : 'FamixTMultipleFileAnchor',
	#classTraits : 'FamixTMultipleFileAnchor classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1MultipleFileAnchor class >> annotation [

	<FMClass: #MultipleFileAnchor super: #FamixTest1SourceAnchor>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^ self
]
