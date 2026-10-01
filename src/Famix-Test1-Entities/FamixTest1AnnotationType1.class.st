"
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
Class {
	#name : #FamixTest1AnnotationType1,
	#superclass : #FamixTest1Entity,
	#traits : 'FamixTAnnotationType',
	#classTraits : 'FamixTAnnotationType classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1AnnotationType1 class >> annotation [

	<ignoreForCoverage>
	<FMClass: #AnnotationType1 super: #FamixTest1Entity>
	<package: #'Famix-Test1-Entities'>
	<generated>
]
