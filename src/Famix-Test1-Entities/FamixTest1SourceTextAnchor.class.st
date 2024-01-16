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
	#name : #FamixTest1SourceTextAnchor,
	#superclass : #FamixTest1SourceAnchor,
	#traits : 'FamixTHasImmediateSource',
	#classTraits : 'FamixTHasImmediateSource classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1SourceTextAnchor class >> annotation [

	<FMClass: #SourceTextAnchor super: #FamixTest1SourceAnchor>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^ self
]
