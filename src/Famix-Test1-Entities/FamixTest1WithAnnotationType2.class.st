"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `definedAnnotationTypes` | `FamixTWithAnnotationTypes` | `annotationTypesContainer` | `FamixTAnnotationType` | The container in which the AnnotationTypes may be declared|



"
Class {
	#name : 'FamixTest1WithAnnotationType2',
	#superclass : 'FamixTest1Entity',
	#traits : 'FamixTWithAnnotationTypes',
	#classTraits : 'FamixTWithAnnotationTypes classTrait',
	#category : 'Famix-Test1-Entities-Entities',
	#package : 'Famix-Test1-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixTest1WithAnnotationType2 class >> annotation [

	<ignoreForCoverage>
	<FMClass: #WithAnnotationType2 super: #FamixTest1Entity>
	<package: #'Famix-Test1-Entities'>
	<generated>
]
