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
| `annotationTypeAttribute` | `FamixTAnnotationInstanceAttribute` | `annotationAttributeInstances` | `FamixTAnnotationTypeAttribute` | This corresponds to the type of the attribute in an AnnotationInstance|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `value` | `Object` | nil | Actual value of the attribute used in an annotation|

"
Class {
	#name : 'FamixStAnnotationInstanceAttribute',
	#superclass : 'FamixStSourcedEntity',
	#traits : 'FamixTAnnotationInstanceAttribute',
	#classTraits : 'FamixTAnnotationInstanceAttribute classTrait',
	#category : 'Famix-PharoSmalltalk-Entities-Entities',
	#package : 'Famix-PharoSmalltalk-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixStAnnotationInstanceAttribute class >> annotation [

	<ignoreForCoverage>
	<FMClass: #AnnotationInstanceAttribute super: #FamixStSourcedEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
]

{ #category : 'accessing' }
FamixStAnnotationInstanceAttribute >> name [
	^ self annotationTypeAttribute ifNotNil: #name
]
