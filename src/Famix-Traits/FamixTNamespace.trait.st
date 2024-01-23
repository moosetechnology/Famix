"
FamixTNamespace represents a namespace from the source language. Namespaces have semantic meaning in the language so they influence the unique name of the entity.

A namespace denotes an entity that has meaning from a language point of view. For example, in C++, there exist a concept with the same name that has no other responsibility beside providing a lexical scope for the contained classes and funcions.

When an entity is placed inside a namespace, the fully qualified name (mooseName) is affected.

## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Trait {
	#name : #FamixTNamespace,
	#traits : 'FamixTNamedEntity + FamixTSourceEntity + TEntityMetaLevelDependency',
	#classTraits : 'FamixTNamedEntity classTrait + FamixTSourceEntity classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-Traits-Named'
}

{ #category : #meta }
FamixTNamespace classSide >> annotation [

	<FMClass: #TNamespace super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #groups }
FamixTNamespace classSide >> annotationFamixNamespaceGroup [
	<generated>
	<mooseGroup>
	^ FamixNamespaceGroup
]

{ #category : #testing }
FamixTNamespace >> isNamespace [

	<generated>
	^ true
]
