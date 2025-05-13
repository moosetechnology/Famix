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
| `value` | `String` | nil | Actual value of the attribute used in an annotation|

"
Trait {
	#name : #FamixTAnnotationInstanceAttribute,
	#instVars : [
		'#annotationTypeAttribute => FMOne type: #FamixTAnnotationTypeAttribute opposite: #annotationAttributeInstances',
		'#parentAnnotationInstance => FMOne type: #FamixTAnnotationInstance opposite: #attributes',
		'#value => FMProperty'
	],
	#traits : 'TEntityMetaLevelDependency',
	#classTraits : 'TEntityMetaLevelDependency classTrait',
	#category : #'Famix-Traits-AnnotationInstanceAttribute'
}

{ #category : #meta }
FamixTAnnotationInstanceAttribute classSide >> annotation [

	<FMClass: #TAnnotationInstanceAttribute super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixTAnnotationInstanceAttribute >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTAnnotationInstanceAttribute: self
]

{ #category : #accessing }
FamixTAnnotationInstanceAttribute >> annotationTypeAttribute [
	"Relation named: #annotationTypeAttribute type: #FamixTAnnotationTypeAttribute opposite: #annotationAttributeInstances"

	<generated>
	<FMComment: 'This corresponds to the type of the attribute in an AnnotationInstance'>
	^ annotationTypeAttribute
]

{ #category : #accessing }
FamixTAnnotationInstanceAttribute >> annotationTypeAttribute: anObject [

	<generated>
	annotationTypeAttribute := anObject
]

{ #category : #accessing }
FamixTAnnotationInstanceAttribute >> parentAnnotationInstance [
	"Relation named: #parentAnnotationInstance type: #FamixTAnnotationInstance opposite: #attributes"

	<generated>
	<FMComment: 'The instance of the annotation in which the attribute is used.'>
	<container>
	^ parentAnnotationInstance
]

{ #category : #accessing }
FamixTAnnotationInstanceAttribute >> parentAnnotationInstance: anObject [

	<generated>
	parentAnnotationInstance := anObject
]

{ #category : #navigation }
FamixTAnnotationInstanceAttribute >> parentAnnotationInstanceGroup [
	<generated>
	<navigation: 'ParentAnnotationInstance'>
	^ MooseSpecializedGroup with: self parentAnnotationInstance
]

{ #category : #accessing }
FamixTAnnotationInstanceAttribute >> value [

	<FMProperty: #value type: #String>
	<generated>
	<FMComment: 'Actual value of the attribute used in an annotation'>
	^ value
]

{ #category : #accessing }
FamixTAnnotationInstanceAttribute >> value: anObject [
	<generated>
	value := anObject
]
