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
	#name : #FamixStAnnotationInstanceAttribute,
	#superclass : #FamixStSourcedEntity,
	#traits : 'FamixTAnnotationInstanceAttribute + FamixTTypedAnnotationInstanceAttribute',
	#classTraits : 'FamixTAnnotationInstanceAttribute classTrait + FamixTTypedAnnotationInstanceAttribute classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStAnnotationInstanceAttribute class >> annotation [

	<FMClass: #AnnotationInstanceAttribute super: #FamixStSourcedEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixStAnnotationInstanceAttribute >> name [
	^ self annotationTypeAttribute ifNotNil: #name
]
