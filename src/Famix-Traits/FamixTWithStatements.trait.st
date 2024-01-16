"
## Relations
======================

### Outgoing dependencies
| Relation | Type | Opposite | Comment |
| `accesses` | `FamixTAccess` | `accessor` | Accesses to variables made by this behaviour.|
| `outgoingInvocations` | `FamixTInvocation` | `sender` | Outgoing invocations sent by this behaviour.|
| `outgoingReferences` | `FamixTReference` | `referencer` | References from this entity to other entities.|

### Other
| Relation | Type | Opposite | Comment |
| `sourceAnchor` | `FamixTSourceAnchor` | `element` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Comment |
| `isStub` | Boolean | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|

"
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
	^ self
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

{ #category : #'as yet unclassified' }
FamixTWithStatements >> numberOfLinesOfDeadCode [

	self deprecated:
		'This method will be removed in the next version of Moose'.
	^ self
		  lookUpPropertyNamed: #numberOflinesOfDeadCode
		  computedAs: [ self deadChildren sumNumbers: #numberOfLinesOfCode ]
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
