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
