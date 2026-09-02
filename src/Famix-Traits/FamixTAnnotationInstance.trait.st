"
AnnotationInstance is an instance of an AnnotationType. It links an AnnotationType to an actual entity.

For example, the following is an annotation instance in Smalltalk.
<primitive: 'primAnyBitFromTo' module:'LargeIntegers'>.

And the following is an AnnotationInstance in Java:
@Test(timeout = 500)

Instance Variables:
	annotatedEntity	<FamixTEntity>
	annotationType		<FamixTAnnotationType>

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `attributes` | `FamixTAnnotationInstance` | `parentAnnotationInstance` | `FamixTAnnotationInstanceAttribute` | This corresponds to the actual values of the attributes in an AnnotationInstance|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `annotatedEntity` | `FamixTAnnotationInstance` | `annotationInstances` | `FamixTWithAnnotationInstances` | The NamedEntity on which the annotation occurs.|
| `annotationType` | `FamixTAnnotationInstance` | `instances` | `FamixTAnnotationType` | Refers to the type of an annotation. (In some languages, Java and C#, an annotation as an explicit type). |



"
Trait {
	#name : 'FamixTAnnotationInstance',
	#instVars : [
		'#annotatedEntity => FMOne type: #FamixTWithAnnotationInstances opposite: #annotationInstances',
		'#annotationType => FMOne type: #FamixTAnnotationType opposite: #instances',
		'#attributes => FMMany type: #FamixTAnnotationInstanceAttribute opposite: #parentAnnotationInstance'
	],
	#traits : 'TEntityMetaLevelDependency',
	#classTraits : 'TEntityMetaLevelDependency classTrait',
	#category : 'Famix-Traits-AnnotationInstance',
	#package : 'Famix-Traits',
	#tag : 'AnnotationInstance'
}

{ #category : 'meta' }
FamixTAnnotationInstance classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TAnnotationInstance super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'groups' }
FamixTAnnotationInstance classSide >> annotationFamixAnnotationInstanceGroup [

	<ignoreForCoverage>
	<generated>
	<mooseGroup>
	^ FamixAnnotationInstanceGroup
]

{ #category : 'adding' }
FamixTAnnotationInstance >> addAttribute: anObject [

	<ignoreForCoverage>
	<generated>
	^ self attributes add: anObject
]

{ #category : 'accessing' }
FamixTAnnotationInstance >> annotatedEntity [
	"Relation named: #annotatedEntity type: #FamixTWithAnnotationInstances opposite: #annotationInstances"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The NamedEntity on which the annotation occurs.'>
	^ annotatedEntity
]

{ #category : 'accessing' }
FamixTAnnotationInstance >> annotatedEntity: anObject [

	<ignoreForCoverage>
	<generated>
	annotatedEntity := anObject
]

{ #category : 'accessing' }
FamixTAnnotationInstance >> annotationType [
	"Relation named: #annotationType type: #FamixTAnnotationType opposite: #instances"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'Refers to the type of an annotation. (In some languages, Java and C#, an annotation as an explicit type). '>
	^ annotationType
]

{ #category : 'accessing' }
FamixTAnnotationInstance >> annotationType: anObject [

	<ignoreForCoverage>
	<generated>
	annotationType := anObject
]

{ #category : 'accessing' }
FamixTAnnotationInstance >> attributes [
	"Relation named: #attributes type: #FamixTAnnotationInstanceAttribute opposite: #parentAnnotationInstance"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'This corresponds to the actual values of the attributes in an AnnotationInstance'>
	<derived>
	^ attributes
]

{ #category : 'accessing' }
FamixTAnnotationInstance >> attributes: anObject [

	<ignoreForCoverage>
	<generated>
	attributes value: anObject
]

{ #category : 'printing' }
FamixTAnnotationInstance >> displayStringOn: aStream [

	self annotationType displayStringOn: aStream.
	aStream << ' on '.
	self annotatedEntity displayStringOn: aStream
]
