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



"
Trait {
	#name : #FamixTAnnotationInstance,
	#instVars : [
		'#annotatedEntity => FMOne type: #FamixTWithAnnotationInstances opposite: #annotationInstances',
		'#attributes => FMMany type: #FamixTAnnotationInstanceAttribute opposite: #parentAnnotationInstance'
	],
	#traits : 'TEntityMetaLevelDependency',
	#classTraits : 'TEntityMetaLevelDependency classTrait',
	#category : #'Famix-Traits-AnnotationInstance'
}

{ #category : #meta }
FamixTAnnotationInstance classSide >> annotation [

	<FMClass: #TAnnotationInstance super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #groups }
FamixTAnnotationInstance classSide >> annotationFamixAnnotationInstanceGroup [
	<generated>
	<mooseGroup>
	^ FamixAnnotationInstanceGroup
]

{ #category : #adding }
FamixTAnnotationInstance >> addAttribute: anObject [
	<generated>
	^ self attributes add: anObject
]

{ #category : #accessing }
FamixTAnnotationInstance >> annotatedEntity [
	"Relation named: #annotatedEntity type: #FamixTWithAnnotationInstances opposite: #annotationInstances"

	<generated>
	<FMComment: 'The NamedEntity on which the annotation occurs.'>
	^ annotatedEntity
]

{ #category : #accessing }
FamixTAnnotationInstance >> annotatedEntity: anObject [

	<generated>
	annotatedEntity := anObject
]

{ #category : #accessing }
FamixTAnnotationInstance >> attributes [
	"Relation named: #attributes type: #FamixTAnnotationInstanceAttribute opposite: #parentAnnotationInstance"

	<generated>
	<FMComment: 'This corresponds to the actual values of the attributes in an AnnotationInstance'>
	<derived>
	^ attributes
]

{ #category : #accessing }
FamixTAnnotationInstance >> attributes: anObject [

	<generated>
	attributes value: anObject
]

{ #category : #printing }
FamixTAnnotationInstance >> displayStringOn: aStream [

	self annotationType displayStringOn: aStream.
	aStream << ' on '.
	self annotatedEntity displayStringOn: aStream
]
