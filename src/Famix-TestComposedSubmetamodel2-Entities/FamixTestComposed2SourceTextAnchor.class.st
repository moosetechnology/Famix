"
## Relations
======================

### Other
| Relation | Type | Opposite | Comment |
| `element` | `FamixTSourceEntity` | `sourceAnchor` | Enable the accessibility to the famix entity that this class is a source pointer for|


## Properties
======================

| Name | Type | Comment |
| `source` | String | Actual source code of the source entity|

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
