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
	#name : 'FamixTest7SourceTextAnchor',
	#superclass : 'FamixTest7SourceAnchor',
	#traits : 'FamixTHasImmediateSource',
	#classTraits : 'FamixTHasImmediateSource classTrait',
	#category : 'Famix-Test7-Entities-Entities',
	#package : 'Famix-Test7-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTest7SourceTextAnchor class >> annotation [

	<ignoreForCoverage>
	<FMClass: #SourceTextAnchor super: #FamixTest7SourceAnchor>
	<package: #'Famix-Test7-Entities'>
	<generated>
]
