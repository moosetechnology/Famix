"
## Relations
======================

### Parents
| Relation | Type | Opposite | Comment |
| `annotationTypesContainer` | `FamixTWithAnnotationTypes` | `definedAnnotationTypes` | Container in which an AnnotationType may reside|

### Other
| Relation | Type | Opposite | Comment |
| `instances` | `FamixTTypedAnnotationInstance` | `annotationType` | Annotations of this type|



"
Class {
	#name : #FamixTest5AnnotationType2,
	#superclass : #FamixTest5Entity,
	#traits : 'FamixTAnnotationType',
	#classTraits : 'FamixTAnnotationType classTrait',
	#category : #'Famix-Test5-Entities-Entities'
}

{ #category : #meta }
FamixTest5AnnotationType2 class >> annotation [

	<FMClass: #AnnotationType2 super: #FamixTest5Entity>
	<package: #'Famix-Test5-Entities'>
	<generated>
	^ self
]
