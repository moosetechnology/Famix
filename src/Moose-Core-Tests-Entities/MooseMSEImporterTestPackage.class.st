"
## Relations
======================

### Parents
- Relation: #parentPackage Type: #FamixTPackage Opposite: #childEntities Comment: Package containing the entity in the code structure (if applicable)
### Children
- Relation: #childEntities Type: #FamixTPackageable Opposite: #parentPackage
- Relation: #types Type: #FamixTType Opposite: #typeContainer Comment: Types contained (declared) in this entity, if any.
#types is declared in ContainerEntity because different kinds of container can embed types. Types are usually contained in a Famix.Namespace. But types can also be contained in a Famix.Class or Famix.Method (in Java with inner classes for example). Famix.Function can also contain some types such as structs.
### Other
- Relation: #sourceAnchor Type: #FamixTSourceAnchor Opposite: #element Comment: SourceAnchor entity linking to the original source code for this entity

## Properties
======================

- Named: #isStub Type: Boolean Comment: Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.
- Named: #name Type: String Comment: Basic name of the entity, not full reference.

"
Class {
	#name : #MooseMSEImporterTestPackage,
	#superclass : #MooseMSEImporterTestNamedEntity,
	#traits : 'FamixTPackage + FamixTPackageable + FamixTWithClasses',
	#classTraits : 'FamixTPackage classTrait + FamixTPackageable classTrait + FamixTWithClasses classTrait',
	#category : #'Moose-Core-Tests-Entities-Entities'
}

{ #category : #meta }
MooseMSEImporterTestPackage class >> annotation [

	<FMClass: #Package super: #MooseMSEImporterTestNamedEntity>
	<package: #'Moose-Core-Tests-Entities'>
	<generated>
	^ self
]
