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
	#name : #FamixStSourceTextAnchor,
	#superclass : #FamixStSourceAnchor,
	#traits : 'FamixTHasImmediateSource',
	#classTraits : 'FamixTHasImmediateSource classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStSourceTextAnchor class >> annotation [

	<FMClass: #SourceTextAnchor super: #FamixStSourceAnchor>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^ self
]
