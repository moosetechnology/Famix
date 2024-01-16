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
	#name : #MooseMSEImporterTestSourceTextAnchor,
	#superclass : #MooseMSEImporterTestSourceAnchor,
	#traits : 'FamixTHasImmediateSource',
	#classTraits : 'FamixTHasImmediateSource classTrait',
	#category : #'Moose-Core-Tests-Entities-Entities'
}

{ #category : #meta }
MooseMSEImporterTestSourceTextAnchor class >> annotation [

	<FMClass: #SourceTextAnchor super: #MooseMSEImporterTestSourceAnchor>
	<package: #'Moose-Core-Tests-Entities'>
	<generated>
	^ self
]
