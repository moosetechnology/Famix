"
## Relations
======================

### Parents
- Relation: #parentType Type: #FamixTWithAttributes Opposite: #attributes Comment: Type declaring the attribute. belongsTo implementation
### Incoming dependencies
- Relation: #incomingAccesses Type: #FamixTAccess Opposite: #variable Comment: All Famix accesses pointing to this structural entity
### Other
- Relation: #annotationAttributeInstances Type: #FamixTTypedAnnotationInstanceAttribute Opposite: #annotationTypeAttribute Comment: A collection of AnnotationInstanceAttribute which hold the usages of this attribute in actual AnnotationInstances
- Relation: #annotationTypeAttribute Type: #FamixTAnnotationTypeAttribute Opposite: #annotationAttributeInstances Comment: This corresponds to the type of the attribute in an AnnotationInstance
- Relation: #comments Type: #FamixTComment Opposite: #commentedEntity Comment: List of comments for the entity
- Relation: #declaredType Type: #FamixTType Opposite: #typedEntities Comment: Type of the entity, if any
- Relation: #sourceAnchor Type: #FamixTSourceAnchor Opposite: #element Comment: SourceAnchor entity linking to the original source code for this entity

## Properties
======================

- Named: #isStub Type: Boolean Comment: Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.
- Named: #name Type: String Comment: Basic name of the entity, not full reference.

"
Class {
	#name : #FamixJavaAnnotationTypeAttribute,
	#superclass : #FamixJavaNamedEntity,
	#traits : 'FamixTAnnotationTypeAttribute + FamixTTypedAnnotationInstanceAttribute + FamixTWithComments',
	#classTraits : 'FamixTAnnotationTypeAttribute classTrait + FamixTTypedAnnotationInstanceAttribute classTrait + FamixTWithComments classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaAnnotationTypeAttribute class >> annotation [

	<FMClass: #AnnotationTypeAttribute super: #FamixJavaNamedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixJavaAnnotationTypeAttribute >> parentAnnotationType [
	<FMProperty: #parentAnnotationType type: #FamixJavaAnnotationType> 
	<derived> 
	<FMComment: 'This is an alias pointing to the AnnotationType that defines this attribute'>

	^ self parentType
]

{ #category : #accessing }
FamixJavaAnnotationTypeAttribute >> parentAnnotationType: anAnnotationType [
	self parentType: anAnnotationType
]
