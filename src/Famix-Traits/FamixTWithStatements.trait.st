Trait {
	#name : #FamixTWithStatements,
	#traits : 'FamixTSourceEntity + FamixTWithAccesses + FamixTWithInvocations + FamixTWithReferences',
	#classTraits : 'FamixTSourceEntity classTrait + FamixTWithAccesses classTrait + FamixTWithInvocations classTrait + FamixTWithReferences classTrait',
	#category : #'Famix-Traits-Behavioral'
}

{ #category : #meta }
FamixTWithStatements classSide >> annotation [

	<FMClass: #TWithStatements super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #metrics }
FamixTWithStatements >> computeCyclomaticComplexity [
	^ self notExistentMetricValue
]

{ #category : #testing }
FamixTWithStatements >> isBehavioural [

	<generated>
	^ true
]

{ #category : #metrics }
FamixTWithStatements >> numberOfLinesOfDeadCode [
	<FMProperty: #numberOflinesOfDeadCode type: #Number>
	<FMComment: 'Number of lines of dead code present in the entity.'>
	<derived>
	^ self lookUpPropertyNamed: #numberOflinesOfDeadCode computedAs: [ self deadChildren sumNumbers: #numberOfLinesOfCode ]
]

{ #category : #metrics }
FamixTWithStatements >> numberOfStatements [
	<FMProperty: #numberOfStatements type: #Number>
	<derived>
	<FMComment: 'The number of statements in a class'>
	^ self lookUpPropertyNamed: #numberOfStatements computedAs: [ MooseUnavailableMetric ]
]

{ #category : #metrics }
FamixTWithStatements >> numberOfStatements: aNumber [
	self cacheAt: #numberOfStatements put: aNumber
]

{ #category : #asserting }
FamixTWithStatements >> shouldCountChildrenForLinesOfCodeIfNoSourceAnchor [
	^ false
]
