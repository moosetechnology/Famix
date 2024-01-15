"
## Relations
======================

### Other
- Relation: #element Type: #FamixTSourceEntity Opposite: #sourceAnchor Comment: Enable the accessibility to the famix entity that this class is a source pointer for

## Properties
======================

- Named: #source Type: String Comment: Actual source code of the source entity

"
Class {
	#name : #FamixTest3SourceTextAnchor,
	#superclass : #FamixTest3SourceAnchor,
	#traits : 'FamixTHasImmediateSource',
	#classTraits : 'FamixTHasImmediateSource classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3SourceTextAnchor class >> annotation [

	<FMClass: #SourceTextAnchor super: #FamixTest3SourceAnchor>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^ self
]
