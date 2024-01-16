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
