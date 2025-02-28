"
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
| `annotationType` | `FamixTAnnotationInstance` | `instances` | `FamixTAnnotationType` | Refers to the type of an annotation. (In some languages, Java and C#, an annotation as an explicit type). |



"
Class {
	#name : #FamixStAnnotationInstance,
	#superclass : #FamixStSourcedEntity,
	#traits : 'FamixTAnnotationInstance + FamixTTypedAnnotationInstance',
	#classTraits : 'FamixTAnnotationInstance classTrait + FamixTTypedAnnotationInstance classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStAnnotationInstance class >> annotation [

	<FMClass: #AnnotationInstance super: #FamixStSourcedEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixStAnnotationInstance >> name [
	^ String
		streamContents: [ :stream | 
			stream << '@'
				<< (self annotationType ifNil: [ super name ] ifNotNil: [ :type | type name ])
				<< ' on ' << (self annotatedEntity ifNotNil: #name ifNil: [ 'undefined' ]) ]
]
