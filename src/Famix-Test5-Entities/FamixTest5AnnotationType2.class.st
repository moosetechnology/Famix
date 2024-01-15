"
## Relations
======================

### Parents
- Relation: #annotationTypesContainer Type: #FamixTWithAnnotationTypes Opposite: #definedAnnotationTypes Comment: Container in which an AnnotationType may reside
### Other
- Relation: #instances Type: #FamixTTypedAnnotationInstance Opposite: #annotationType Comment: Annotations of this type


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
