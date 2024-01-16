"
## Relations
======================

### Parents
- Relation: #parentAnnotationInstance Type: #FamixTWithAnnotationInstanceAttributes Opposite: #attributes Comment: The instance of the annotation in which the attribute is used.
### Other
- Relation: #annotationTypeAttribute Type: #FamixTAnnotationTypeAttribute Opposite: #annotationAttributeInstances Comment: This corresponds to the type of the attribute in an AnnotationInstance

## Properties
======================

- Named: #value Type: String Comment: Actual value of the attribute used in an annotation

"
Class {
	#name : #FamixJavaAnnotationInstanceAttribute,
	#superclass : #FamixJavaSourcedEntity,
	#traits : 'FamixTAnnotationInstanceAttribute + FamixTTypedAnnotationInstanceAttribute',
	#classTraits : 'FamixTAnnotationInstanceAttribute classTrait + FamixTTypedAnnotationInstanceAttribute classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaAnnotationInstanceAttribute class >> annotation [

	<FMClass: #AnnotationInstanceAttribute super: #FamixJavaSourcedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixJavaAnnotationInstanceAttribute >> name [
	^ self annotationTypeAttribute ifNotNil: #name
]
