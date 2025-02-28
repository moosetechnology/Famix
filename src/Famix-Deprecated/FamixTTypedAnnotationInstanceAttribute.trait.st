"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `annotationTypeAttribute` | `FamixTTypedAnnotationInstanceAttribute` | `annotationAttributeInstances` | `FamixTAnnotationTypeAttribute` | This corresponds to the type of the attribute in an AnnotationInstance|



"
Trait {
	#name : #FamixTTypedAnnotationInstanceAttribute,
	#instVars : [
		'#annotationTypeAttribute => FMOne type: #FamixTAnnotationTypeAttribute opposite: #annotationAttributeInstances'
	],
	#category : #'Famix-Deprecated'
}

{ #category : #accessing }
FamixTTypedAnnotationInstanceAttribute >> annotationTypeAttribute [
	"Relation named: #annotationTypeAttribute type: #FamixTAnnotationTypeAttribute opposite: #annotationAttributeInstances"

	<generated>
	<FMComment: 'This corresponds to the type of the attribute in an AnnotationInstance'>
	^ annotationTypeAttribute
]

{ #category : #accessing }
FamixTTypedAnnotationInstanceAttribute >> annotationTypeAttribute: anObject [

	<generated>
	annotationTypeAttribute := anObject
]
