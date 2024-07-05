"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `element` | `FamixTSourceAnchor` | `sourceAnchor` | `FamixTSourceEntity` | Enable the accessibility to the famix entity that this class is a source pointer for|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `source` | `String` | nil | Actual source code of the source entity|

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
