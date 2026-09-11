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
	#name : 'FamixTest5AnnotationType1',
	#superclass : 'FamixTest5Entity',
	#traits : 'FamixTAnnotationType',
	#classTraits : 'FamixTAnnotationType classTrait',
	#category : 'Famix-Test5-Entities-Entities',
	#package : 'Famix-Test5-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTest5AnnotationType1 class >> annotation [

	<ignoreForCoverage>
	<FMClass: #AnnotationType1 super: #FamixTest5Entity>
	<package: #'Famix-Test5-Entities'>
	<generated>
]
