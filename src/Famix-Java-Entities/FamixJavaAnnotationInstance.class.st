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
| `annotationType` | `FamixTTypedAnnotationInstance` | `instances` | `FamixTAnnotationType` | Refers to the type of an annotation. (In some languages, Java and C#, an annotation as an explicit type). |



"
Class {
	#name : #FamixJavaAnnotationInstance,
	#superclass : #FamixJavaSourcedEntity,
	#traits : 'FamixTAnnotationInstance + FamixTTypedAnnotationInstance',
	#classTraits : 'FamixTAnnotationInstance classTrait + FamixTTypedAnnotationInstance classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaAnnotationInstance class >> annotation [

	<FMClass: #AnnotationInstance super: #FamixJavaSourcedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #printing }
FamixJavaAnnotationInstance >> mooseNameOn: aStream [
	self annotationType ifNotNil: [ :at | at mooseNameOn: aStream ].
	aStream nextPut: $(.
	self attributes do: [ :each | aStream nextPutAll: each value asString ] separatedBy: [ aStream nextPut: $, ].
	aStream nextPut: $).
	aStream nextPut: $-.
	self annotatedEntity ifNotNil: [ :ae | ae mooseNameOn: aStream ]
]

{ #category : #accessing }
FamixJavaAnnotationInstance >> name [
	^ String
		streamContents: [ :stream | 
			stream << '@'
				<< (self annotationType ifNil: [ super name ] ifNotNil: [ :type | type name ])
				<< ' on ' << (self annotatedEntity ifNotNil: #name ifNil: [ 'undefined' ]) ]
]
