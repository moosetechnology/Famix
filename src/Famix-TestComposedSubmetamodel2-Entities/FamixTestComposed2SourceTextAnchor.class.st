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
	#name : #FamixTestComposed2SourceTextAnchor,
	#superclass : #FamixTestComposed2SourceAnchor,
	#traits : 'FamixTHasImmediateSource',
	#classTraits : 'FamixTHasImmediateSource classTrait',
	#category : #'Famix-TestComposedSubmetamodel2-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed2SourceTextAnchor class >> annotation [

	<FMClass: #SourceTextAnchor super: #FamixTestComposed2SourceAnchor>
	<package: #'Famix-TestComposedSubmetamodel2-Entities'>
	<generated>
	^ self
]
