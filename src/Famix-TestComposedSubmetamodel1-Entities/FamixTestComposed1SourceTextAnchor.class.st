"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
| `element` | `FamixTSourceAnchor` | `sourceAnchor` | `FamixTSourceEntity` | Enable the accessibility to the famix entity that this class is a source pointer for|


## Properties
======================

| Name | Type | Default value | Comment |
| `source` | `String` | nil | Actual source code of the source entity|

"
Class {
	#name : #FamixTestComposed1SourceTextAnchor,
	#superclass : #FamixTestComposed1SourceAnchor,
	#traits : 'FamixTHasImmediateSource',
	#classTraits : 'FamixTHasImmediateSource classTrait',
	#category : #'Famix-TestComposedSubmetamodel1-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed1SourceTextAnchor class >> annotation [

	<FMClass: #SourceTextAnchor super: #FamixTestComposed1SourceAnchor>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
	^ self
]
