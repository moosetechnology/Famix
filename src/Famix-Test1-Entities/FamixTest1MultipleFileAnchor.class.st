"
## Relations
======================

### Other
- Relation: #element Type: #FamixTSourceEntity Opposite: #sourceAnchor Comment: Enable the accessibility to the famix entity that this class is a source pointer for

## Properties
======================

- Named: #fileAnchors Type: FamixTFileAnchor Comment: All source code definition files

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
