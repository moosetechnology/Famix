"
## Relations
======================

### Children
| Relation | Type | Opposite | Comment |
| `attributes` | `FamixTAnnotationInstanceAttribute` | `parentAnnotationInstance` | This corresponds to the actual values of the attributes in an AnnotationInstance|

### Other
| Relation | Type | Opposite | Comment |
| `annotatedEntity` | `FamixTWithAnnotationInstances` | `annotationInstances` | The NamedEntity on which the annotation occurs.|
| `annotationType` | `FamixTAnnotationType` | `instances` | Refers to the type of an annotation. (In some languages, Java and C#, an annotation as an explicit type). |



"
Class {
	#name : #FamixStAnnotationInstance,
	#superclass : #FamixStSourcedEntity,
	#traits : 'FamixTAnnotationInstance + FamixTTypedAnnotationInstance + FamixTWithAnnotationInstanceAttributes',
	#classTraits : 'FamixTAnnotationInstance classTrait + FamixTTypedAnnotationInstance classTrait + FamixTWithAnnotationInstanceAttributes classTrait',
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
