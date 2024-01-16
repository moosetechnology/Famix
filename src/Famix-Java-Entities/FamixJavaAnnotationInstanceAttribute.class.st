"
## Relations
======================

### Parents
| Relation | Type | Opposite | Comment |
| `parentAnnotationInstance` | `FamixTWithAnnotationInstanceAttributes` | `attributes` | The instance of the annotation in which the attribute is used.|

### Other
| Relation | Type | Opposite | Comment |
| `annotationTypeAttribute` | `FamixTAnnotationTypeAttribute` | `annotationAttributeInstances` | This corresponds to the type of the attribute in an AnnotationInstance|


## Properties
======================

| Name | Type | Comment |
| `value` | String | Actual value of the attribute used in an annotation|

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
