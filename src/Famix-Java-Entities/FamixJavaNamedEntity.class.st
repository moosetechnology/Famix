"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `annotationInstances` | `FamixTWithAnnotationInstances` | `annotatedEntity` | `FamixTAnnotationInstance` | This property corresponds to the set of annotations associated to the entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Class {
	#name : #FamixJavaNamedEntity,
	#superclass : #FamixJavaSourcedEntity,
	#traits : 'FamixTNamedEntity + FamixTWithAnnotationInstances + TEntityMetaLevelDependency',
	#classTraits : 'FamixTNamedEntity classTrait + FamixTWithAnnotationInstances classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaNamedEntity class >> annotation [

	<FMClass: #NamedEntity super: #FamixJavaSourcedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixJavaNamedEntity class >> isAbstract [

	<generated>
	^ self == FamixJavaNamedEntity
]

{ #category : #visitor }
FamixJavaNamedEntity >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixJavaNamedEntity: self
]

{ #category : #testing }
FamixJavaNamedEntity >> isNamedEntity [

	<generated>
	^ true
]

{ #category : #'Famix-Extensions' }
FamixJavaNamedEntity >> stubFormattedName [
	 ^ self isStub 
		ifTrue: [ Text 
					string: self name
					attribute: TextEmphasis italic ]
		ifFalse: [ Text fromString: self name ] 
]

{ #category : #testing }
FamixJavaNamedEntity >> topLevelPackage [ 
	^ (self atScope: FamixTPackage) anyOne topLevelPackage 
]
