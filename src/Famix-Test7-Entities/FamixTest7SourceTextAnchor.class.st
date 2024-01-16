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
	#name : #FamixTest7SourceTextAnchor,
	#superclass : #FamixTest7SourceAnchor,
	#traits : 'FamixTHasImmediateSource',
	#classTraits : 'FamixTHasImmediateSource classTrait',
	#category : #'Famix-Test7-Entities-Entities'
}

{ #category : #meta }
FamixTest7SourceTextAnchor class >> annotation [

	<FMClass: #SourceTextAnchor super: #FamixTest7SourceAnchor>
	<package: #'Famix-Test7-Entities'>
	<generated>
	^ self
]
