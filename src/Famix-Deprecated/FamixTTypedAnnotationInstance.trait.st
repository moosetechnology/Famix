"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `annotationType` | `FamixTTypedAnnotationInstance` | `instances` | `FamixTAnnotationType` | Refers to the type of an annotation. (In some languages, Java and C#, an annotation as an explicit type). |



"
Trait {
	#name : #FamixTTypedAnnotationInstance,
	#instVars : [
		'#annotationType => FMOne type: #FamixTAnnotationType opposite: #instances'
	],
	#category : #'Famix-Deprecated'
}

{ #category : #accessing }
FamixTTypedAnnotationInstance >> annotationType [
	"Relation named: #annotationType type: #FamixTAnnotationType opposite: #instances"

	<generated>
	<FMComment: 'Refers to the type of an annotation. (In some languages, Java and C#, an annotation as an explicit type). '>
	^ annotationType
]

{ #category : #accessing }
FamixTTypedAnnotationInstance >> annotationType: anObject [

	<generated>
	annotationType := anObject
]
