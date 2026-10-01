"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `definedAnnotationTypes` | `FamixTWithAnnotationTypes` | `annotationTypesContainer` | `FamixTAnnotationType` | The container in which the AnnotationTypes may be declared|



"
Class {
	#name : #FamixTest1WithAnnotationType1,
	#superclass : #FamixTest1Entity,
	#traits : 'FamixTWithAnnotationTypes',
	#classTraits : 'FamixTWithAnnotationTypes classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1WithAnnotationType1 class >> annotation [

	<ignoreForCoverage>
	<FMClass: #WithAnnotationType1 super: #FamixTest1Entity>
	<package: #'Famix-Test1-Entities'>
	<generated>
]
