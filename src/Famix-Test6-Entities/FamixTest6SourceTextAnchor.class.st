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
