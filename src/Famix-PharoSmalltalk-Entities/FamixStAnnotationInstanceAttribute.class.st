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
