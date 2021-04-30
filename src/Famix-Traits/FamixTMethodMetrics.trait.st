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

{ #category : #metrics }
FamixTMethodMetrics >> hierarchyNestingLevel [
	<FMProperty: #hierarchyNestingLevel type: #Number>
	<derived>
	<FMComment: 'The nesting level in the hierarchy'>
	
	^self
		lookUpPropertyNamed: #hierarchyNestingLevel
		computedAs: [self belongsTo hierarchyNestingLevel]
]

{ #category : #metrics }
FamixTMethodMetrics >> hierarchyNestingLevel: aNumber [
	self cacheAt: #hierarchyNestingLevel put: aNumber
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
