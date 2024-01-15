"
## Relations
======================

### Parents
- Relation: #parentPackage Type: #FamixTPackage Opposite: #childEntities Comment: Package containing the entity in the code structure (if applicable)
- Relation: #annotationTypesContainer Type: #FamixTWithAnnotationTypes Opposite: #definedAnnotationTypes Comment: Container in which an AnnotationType may reside
### Children
- Relation: #attributes Type: #FamixTAttribute Opposite: #parentType Comment: List of attributes declared by this type.
### Outgoing dependencies
- Relation: #superInheritances Type: #FamixTInheritance Opposite: #subclass Comment: Superinheritance relationships, i.e. known superclasses of this type.
### Incomming dependencies
- Relation: #implementations Type: #FamixTImplementation Opposite: #interface Comment: Implementation relationships.
- Relation: #subInheritances Type: #FamixTInheritance Opposite: #superclass Comment: Subinheritance relationships, i.e. known subclasses of this type.
### Other
- Relation: #comments Type: #FamixTComment Opposite: #commentedEntity Comment: List of comments for the entity
- Relation: #instances Type: #FamixTTypedAnnotationInstance Opposite: #annotationType Comment: Annotations of this type

## Properties
======================

- Named: #visibility Type: String Comment: Visibility of the entity

"
Class {
	#name : #FamixJavaAnnotationType,
	#superclass : #FamixJavaType,
	#traits : 'FamixTAnnotationType + FamixTHasVisibility + FamixTImplementable + FamixTPackageable + FamixTWithAttributes + FamixTWithComments + FamixTWithInheritances',
	#classTraits : 'FamixTAnnotationType classTrait + FamixTHasVisibility classTrait + FamixTImplementable classTrait + FamixTPackageable classTrait + FamixTWithAttributes classTrait + FamixTWithComments classTrait + FamixTWithInheritances classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaAnnotationType class >> annotation [

	<FMClass: #AnnotationType super: #FamixJavaType>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #'accessing-query' }
FamixJavaAnnotationType >> annotatedEntities [
	^ self instances collect: [:each | each annotatedEntity ]
]

{ #category : #'accessing-query' }
FamixJavaAnnotationType >> annotatedEntitiesGroup [
	<navigation: 'Annotated entities'>
	^ self annotatedEntities asMooseGroup
]

{ #category : #accessing }
FamixJavaAnnotationType >> typeContainer [

	^ self annotationTypesContainer
]

{ #category : #accessing }
FamixJavaAnnotationType >> typeContainer: anObject [

	^ self annotationTypesContainer: anObject
]
