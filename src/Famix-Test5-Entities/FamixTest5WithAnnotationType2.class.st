"
## Relations
======================

### Children
| Relation | Type | Opposite | Comment |
| `definedAnnotationTypes` | `FamixTAnnotationType` | `annotationTypesContainer` | The container in which the AnnotationTypes may be declared|



"
Class {
	#name : #FamixTest5WithAnnotationType2,
	#superclass : #FamixTest5Entity,
	#traits : 'FamixTWithAnnotationTypes',
	#classTraits : 'FamixTWithAnnotationTypes classTrait',
	#category : #'Famix-Test5-Entities-Entities'
}

{ #category : #meta }
FamixTest5WithAnnotationType2 class >> annotation [

	<FMClass: #WithAnnotationType2 super: #FamixTest5Entity>
	<package: #'Famix-Test5-Entities'>
	<generated>
	^ self
]
