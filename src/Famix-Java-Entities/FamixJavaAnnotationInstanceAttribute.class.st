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
	#name : #FamixJavaAnnotationInstanceAttribute,
	#superclass : #FamixJavaSourcedEntity,
	#traits : 'FamixTAnnotationInstanceAttribute',
	#classTraits : 'FamixTAnnotationInstanceAttribute classTrait',
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
