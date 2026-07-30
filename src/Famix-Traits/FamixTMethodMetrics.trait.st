Trait {
	#name : 'FamixTMethodMetrics',
	#category : 'Famix-Traits-Behavioral',
	#package : 'Famix-Traits',
	#tag : 'Behavioral'
}

{ #category : 'meta' }
FamixTMethodMetrics classSide >> annotation [

	<FMClass: #TMethodMetrics super: #Object>
	<package: #'Famix-Traits'>
	<generated>
]

{ #category : 'metrics' }
FamixTMethodMetrics >> cyclomaticComplexity [

	<FMProperty: #cyclomaticComplexity type: #Number>
	<FMComment: 'The number of linear-independent paths through a method.'>
	^ self cacheAt: #cyclomaticComplexity ifAbsent: [ self computeCyclomaticComplexity ]
]

{ #category : 'metrics' }
FamixTMethodMetrics >> cyclomaticComplexity: aNumber [
	self cacheAt: #cyclomaticComplexity put: aNumber
]

{ #category : 'metrics' }
FamixTMethodMetrics >> hierarchyNestingLevel [

	<FMProperty: #hierarchyNestingLevel type: #Number>
	<derived>
	<FMComment: 'The nesting level in the hierarchy'>
	^ self cacheAt: #hierarchyNestingLevel ifAbsent: [ self parentType hierarchyNestingLevel ]
]

{ #category : 'metrics' }
FamixTMethodMetrics >> hierarchyNestingLevel: aNumber [
	self cacheAt: #hierarchyNestingLevel put: aNumber
]
