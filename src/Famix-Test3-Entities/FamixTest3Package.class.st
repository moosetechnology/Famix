"
## Relations
======================

### Children
- Relation: #childEntities Type: #FamixTPackageable Opposite: #parentPackage
### Other
- Relation: #sourceAnchor Type: #FamixTSourceAnchor Opposite: #element Comment: SourceAnchor entity linking to the original source code for this entity

## Properties
======================

- Named: #isStub Type: Boolean Comment: Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.
- Named: #name Type: String Comment: Basic name of the entity, not full reference.

"
Class {
	#name : #FamixTest3Package,
	#superclass : #FamixTest3Entity,
	#traits : 'FamixTPackage',
	#classTraits : 'FamixTPackage classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3Package class >> annotation [

	<FMClass: #Package super: #FamixTest3Entity>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^ self
]
