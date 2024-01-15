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
- Relation: #parentAnnotationInstance Type: #FamixTWithAnnotationInstanceAttributes Opposite: #attributes Comment: The instance of the annotation in which the attribute is used.

## Properties
======================

- Named: #value Type: String Comment: Actual value of the attribute used in an annotation

"
Trait {
	#name : #FamixTAnnotationInstanceAttribute,
	#instVars : [
		'#parentAnnotationInstance => FMOne type: #FamixTWithAnnotationInstanceAttributes opposite: #attributes',
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

{ #category : #accessing }
FamixTAnnotationInstanceAttribute >> parentAnnotationInstance [
	"Relation named: #parentAnnotationInstance type: #FamixTWithAnnotationInstanceAttributes opposite: #attributes"

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
