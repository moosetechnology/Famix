Trait {
	#name : #FamixTMethodMetrics,
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTMethodMetrics classSide >> annotation [

	<FMClass: #TMethodMetrics super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixTMethodMetrics >> numberOfAnnotationInstances [
	<FMProperty: #numberOfAnnotationInstances type: #Number>
	<derived>
	<FMComment: 'The number of annotation instances defined in the method'>

	^self
		lookUpPropertyNamed: #numberOfAnnotationInstances
		computedAs: [self annotationInstances size]
]
