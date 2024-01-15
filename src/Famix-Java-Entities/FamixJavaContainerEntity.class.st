"
## Relations
======================

### Children
- Relation: #definedAnnotationTypes Type: #FamixTAnnotationType Opposite: #annotationTypesContainer Comment: The container in which the AnnotationTypes may be declared
- Relation: #types Type: #FamixTType Opposite: #typeContainer Comment: Types contained (declared) in this entity, if any.
#types is declared in ContainerEntity because different kinds of container can embed types. Types are usually contained in a Famix.Namespace. But types can also be contained in a Famix.Class or Famix.Method (in Java with inner classes for example). Famix.Function can also contain some types such as structs.


"
Class {
	#name : #FamixJavaContainerEntity,
	#superclass : #FamixJavaNamedEntity,
	#traits : 'FamixJavaTWithInterfaces + FamixTWithAnnotationTypes + FamixTWithClasses',
	#classTraits : 'FamixJavaTWithInterfaces classTrait + FamixTWithAnnotationTypes classTrait + FamixTWithClasses classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaContainerEntity class >> annotation [

	<FMClass: #ContainerEntity super: #FamixJavaNamedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixJavaContainerEntity class >> isAbstract [

	<generated>
	^ self == FamixJavaContainerEntity
]

{ #category : #adding }
FamixJavaContainerEntity >> addClass: aClass [
	
	types add: aClass
]

{ #category : #adding }
FamixJavaContainerEntity >> addInterface: anInterface [
	
	types add: anInterface
]

{ #category : #'Famix-Java' }
FamixJavaContainerEntity >> mooseNameWithDots [
	^ self mooseName ifNotNil: [ :mName |  '.' join: (mName substrings: '::') ]
]
