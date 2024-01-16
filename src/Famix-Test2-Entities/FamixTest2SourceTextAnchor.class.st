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
	#name : #FamixTest2SourceTextAnchor,
	#superclass : #FamixTest2SourceAnchor,
	#traits : 'FamixTHasImmediateSource',
	#classTraits : 'FamixTHasImmediateSource classTrait',
	#category : #'Famix-Test2-Entities-Entities'
}

{ #category : #meta }
FamixTest2SourceTextAnchor class >> annotation [

	<FMClass: #SourceTextAnchor super: #FamixTest2SourceAnchor>
	<package: #'Famix-Test2-Entities'>
	<generated>
	^ self
]
