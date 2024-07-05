"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `definedAnnotationTypes` | `FamixTWithAnnotationTypes` | `annotationTypesContainer` | `FamixTAnnotationType` | The container in which the AnnotationTypes may be declared|



"
Class {
	#name : #FamixTest5WithAnnotationType1,
	#superclass : #FamixTest5Entity,
	#traits : 'FamixTWithAnnotationTypes',
	#classTraits : 'FamixTWithAnnotationTypes classTrait',
	#category : #'Famix-Test5-Entities-Entities'
}

{ #category : #meta }
FamixTest5WithAnnotationType1 class >> annotation [

	<FMClass: #WithAnnotationType1 super: #FamixTest5Entity>
	<package: #'Famix-Test5-Entities'>
	<generated>
	^ self
]
