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
	#name : #FamixTest6SourceTextAnchor,
	#superclass : #FamixTest6SourceAnchor,
	#traits : 'FamixTHasImmediateSource',
	#classTraits : 'FamixTHasImmediateSource classTrait',
	#category : #'Famix-Test6-Entities-Entities'
}

{ #category : #meta }
FamixTest6SourceTextAnchor class >> annotation [

	<FMClass: #SourceTextAnchor super: #FamixTest6SourceAnchor>
	<package: #'Famix-Test6-Entities'>
	<generated>
	^ self
]
