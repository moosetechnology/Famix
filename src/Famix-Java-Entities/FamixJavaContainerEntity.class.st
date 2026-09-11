"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `definedAnnotationTypes` | `FamixTWithAnnotationTypes` | `annotationTypesContainer` | `FamixTAnnotationType` | The container in which the AnnotationTypes may be declared|
| `types` | `FamixTWithTypes` | `typeContainer` | `FamixTType` | Types contained (declared) in this entity, if any. #types is declared in ContainerEntity because different kinds of container can embed types. Types are usually contained in a Famix.Namespace. But types can also be contained in a Famix.Class or Famix.Method (in Java with inner classes for example). Famix.Function can also contain some types such as structs.|



"
Class {
	#name : 'FamixJavaContainerEntity',
	#superclass : 'FamixJavaNamedEntity',
	#traits : 'FamixJavaTWithInterfaces + FamixTWithAnnotationTypes + FamixTWithClasses',
	#classTraits : 'FamixJavaTWithInterfaces classTrait + FamixTWithAnnotationTypes classTrait + FamixTWithClasses classTrait',
	#category : 'Famix-Java-Entities-Entities',
	#package : 'Famix-Java-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixJavaContainerEntity class >> annotation [

	<ignoreForCoverage>
	<FMClass: #ContainerEntity super: #FamixJavaNamedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	<abstract>
]

{ #category : 'testing' }
FamixJavaContainerEntity class >> isAbstract [

	<ignoreForCoverage>
	<generated>
	^ self == FamixJavaContainerEntity
]

{ #category : 'adding' }
FamixJavaContainerEntity >> addClass: aClass [
	
	types add: aClass
]

{ #category : 'adding' }
FamixJavaContainerEntity >> addInterface: anInterface [
	
	types add: anInterface
]
