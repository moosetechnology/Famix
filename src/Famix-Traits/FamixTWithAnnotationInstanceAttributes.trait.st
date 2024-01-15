"
## Relations
======================

### Children
- Relation: #attributes Type: #FamixTAnnotationInstanceAttribute Opposite: #parentAnnotationInstance Comment: This corresponds to the actual values of the attributes in an AnnotationInstance


"
Trait {
	#name : #FamixTWithAnnotationInstanceAttributes,
	#instVars : [
		'#attributes => FMMany type: #FamixTAnnotationInstanceAttribute opposite: #parentAnnotationInstance'
	],
	#category : #'Famix-Traits-AnnotationInstanceAttribute'
}

{ #category : #meta }
FamixTWithAnnotationInstanceAttributes classSide >> annotation [

	<FMClass: #TWithAnnotationInstanceAttributes super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixTWithAnnotationInstanceAttributes >> addAttribute: anAttribute [
	attributes add: anAttribute
]

{ #category : #accessing }
FamixTWithAnnotationInstanceAttributes >> attributes [
	"Relation named: #attributes type: #FamixTAnnotationInstanceAttribute opposite: #parentAnnotationInstance"

	<generated>
	<FMComment: 'This corresponds to the actual values of the attributes in an AnnotationInstance'>
	<derived>
	^ attributes
]

{ #category : #accessing }
FamixTWithAnnotationInstanceAttributes >> attributes: anObject [

	<generated>
	attributes value: anObject
]
