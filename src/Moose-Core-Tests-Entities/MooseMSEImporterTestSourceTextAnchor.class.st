"
## Relations
======================

### Other
- Relation: #element Type: #FamixTSourceEntity Opposite: #sourceAnchor Comment: Enable the accessibility to the famix entity that this class is a source pointer for

## Properties
======================

- Named: #source Type: String Comment: Actual source code of the source entity

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
