"
FamixTAnnotationType represents the type of an annotation. In some languages, Java and C#, an annotation as an explicit type. An AnnotationType can have a container in which it resides.

Instance Variables:
	instances	<(FMMultivalueLink of: FamixTAnnotationInstance)>
	container	<FamixTContainerEntity>

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `annotationTypesContainer` | `FamixTAnnotationType` | `definedAnnotationTypes` | `FamixTWithAnnotationTypes` | Container in which an AnnotationType may reside|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `instances` | `FamixTAnnotationType` | `annotationType` | `FamixTAnnotationInstance` | Annotations of this type|



"
Trait {
	#name : #FamixTAnnotationType,
	#instVars : [
		'#annotationTypesContainer => FMOne type: #FamixTWithAnnotationTypes opposite: #definedAnnotationTypes',
		'#instances => FMMany type: #FamixTAnnotationInstance opposite: #annotationType'
	],
	#category : #'Famix-Traits-AnnotationType'
}

{ #category : #meta }
FamixTAnnotationType classSide >> annotation [

	<FMClass: #TAnnotationType super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #groups }
FamixTAnnotationType classSide >> annotationFamixAnnotationTypeGroup [
	<generated>
	<mooseGroup>
	^ FamixAnnotationTypeGroup
]

{ #category : #accessing }
FamixTAnnotationType >> addInstance: anObject [

	instances add: anObject

]

{ #category : #accessing }
FamixTAnnotationType >> annotationTypesContainer [
	"Relation named: #annotationTypesContainer type: #FamixTWithAnnotationTypes opposite: #definedAnnotationTypes"

	<generated>
	<FMComment: 'Container in which an AnnotationType may reside'>
	<container>
	^ annotationTypesContainer
]

{ #category : #accessing }
FamixTAnnotationType >> annotationTypesContainer: anObject [

	<generated>
	annotationTypesContainer := anObject
]

{ #category : #navigation }
FamixTAnnotationType >> annotationTypesContainerGroup [
	<generated>
	<navigation: 'AnnotationTypesContainer'>
	^ MooseSpecializedGroup with: self annotationTypesContainer
]

{ #category : #printing }
FamixTAnnotationType >> displayStringOn: aStream [

	self name ifNotNil: [ :n | aStream << '@' << n ]
]

{ #category : #accessing }
FamixTAnnotationType >> instances [
	"Relation named: #instances type: #FamixTAnnotationInstance opposite: #annotationType"

	<generated>
	<FMComment: 'Annotations of this type'>
	<derived>
	^ instances
]

{ #category : #accessing }
FamixTAnnotationType >> instances: anObject [

	<generated>
	instances value: anObject
]

{ #category : #printing }
FamixTAnnotationType >> mooseNameOn: aStream [
	self annotationTypesContainer
		ifNotNil: [ :parent | 
			parent mooseNameOn: aStream.
			aStream
				nextPut: $. ].
	self name ifNotNil: [ aStream nextPutAll: self name ]
]
