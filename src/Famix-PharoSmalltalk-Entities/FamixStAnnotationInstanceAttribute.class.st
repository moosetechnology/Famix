"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentAnnotationInstance` | `FamixTAnnotationInstanceAttribute` | `attributes` | `FamixTAnnotationInstance` | The instance of the annotation in which the attribute is used.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `annotationTypeAttribute` | `FamixTTypedAnnotationInstanceAttribute` | `annotationAttributeInstances` | `FamixTAnnotationTypeAttribute` | This corresponds to the type of the attribute in an AnnotationInstance|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `value` | `String` | nil | Actual value of the attribute used in an annotation|

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
