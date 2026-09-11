"
This models the actual value of an attribute in an AnnotationInstance.

In the following AnnotationInstance of Java, timeout is an annotation instance attribute :
@Test(timeout = 500)

Instance Variables:
	parentAnnotationInstance	<FamixTAnnotationInstance>
	annotationTypeAttribute	<FamixTAnnotationTypeAttribute>
	value	<Object>

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
Trait {
	#name : 'FamixTAnnotationInstanceAttribute',
	#instVars : [
		'#annotationTypeAttribute => FMOne type: #FamixTAnnotationTypeAttribute opposite: #annotationAttributeInstances',
		'#parentAnnotationInstance => FMOne type: #FamixTAnnotationInstance opposite: #attributes',
		'#value => FMProperty'
	],
	#traits : 'TEntityMetaLevelDependency',
	#classTraits : 'TEntityMetaLevelDependency classTrait',
	#category : 'Famix-Traits-AnnotationInstanceAttribute',
	#package : 'Famix-Traits',
	#tag : 'AnnotationInstanceAttribute'
}

{ #category : 'meta' }
FamixTAnnotationInstanceAttribute classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TAnnotationInstanceAttribute super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'accessing' }
FamixTAnnotationInstanceAttribute >> annotationTypeAttribute [
	"Relation named: #annotationTypeAttribute type: #FamixTAnnotationTypeAttribute opposite: #annotationAttributeInstances"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'This corresponds to the type of the attribute in an AnnotationInstance'>
	^ annotationTypeAttribute
]

{ #category : 'accessing' }
FamixTAnnotationInstanceAttribute >> annotationTypeAttribute: anObject [

	<ignoreForCoverage>
	<generated>
	annotationTypeAttribute := anObject
]

{ #category : 'accessing' }
FamixTAnnotationInstanceAttribute >> parentAnnotationInstance [
	"Relation named: #parentAnnotationInstance type: #FamixTAnnotationInstance opposite: #attributes"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The instance of the annotation in which the attribute is used.'>
	<container>
	^ parentAnnotationInstance
]

{ #category : 'accessing' }
FamixTAnnotationInstanceAttribute >> parentAnnotationInstance: anObject [

	<ignoreForCoverage>
	<generated>
	parentAnnotationInstance := anObject
]

{ #category : 'accessing' }
FamixTAnnotationInstanceAttribute >> value [

	<FMProperty: #value type: #Object>
	<ignoreForCoverage>
	<generated>
	<FMComment: 'Actual value of the attribute used in an annotation'>
	^ value
]

{ #category : 'accessing' }
FamixTAnnotationInstanceAttribute >> value: anObject [
	<ignoreForCoverage>
	<generated>
	value := anObject
]
