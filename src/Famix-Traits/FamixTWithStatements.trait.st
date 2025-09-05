"
## Relations
======================

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `accesses` | `FamixTWithAccesses` | `accessor` | `FamixTAccess` | Accesses to variables made by this behaviour.|
| `outgoingInvocations` | `FamixTWithInvocations` | `sender` | `FamixTInvocation` | Outgoing invocations sent by this behaviour.|
| `outgoingReferences` | `FamixTWithReferences` | `referencer` | `FamixTReference` | References from this entity to other entities.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|

"
Trait {
	#name : 'FamixTWithStatements',
	#traits : 'FamixTCanBeStub + FamixTWithAccesses + FamixTWithInvocations + FamixTWithReferences',
	#classTraits : 'FamixTCanBeStub classTrait + FamixTWithAccesses classTrait + FamixTWithInvocations classTrait + FamixTWithReferences classTrait',
	#category : 'Famix-Traits-Behavioral',
	#package : 'Famix-Traits',
	#tag : 'Behavioral'
}

{ #category : 'meta' }
FamixTWithStatements classSide >> annotation [

	<FMClass: #TWithStatements super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : 'visitor' }
FamixTWithStatements >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTWithStatements: self
]

{ #category : 'metrics' }
FamixTWithStatements >> computeCyclomaticComplexity [
	^ self notExistentMetricValue
]

{ #category : 'testing' }
FamixTWithStatements >> isBehavioural [

	<generated>
	^ true
]

{ #category : 'as yet unclassified' }
FamixTWithStatements >> numberOfLinesOfDeadCode [

	self deprecated: 'This method will be removed in the next version of Moose'.
	^ self cacheAt: #numberOflinesOfDeadCode ifAbsentPut: [ self deadChildren sumNumbers: #numberOfLinesOfCode ]
]

{ #category : 'metrics' }
FamixTWithStatements >> numberOfStatements [

	<FMProperty: #numberOfStatements type: #Number>
	<FMComment: 'The number of statements in a class'>
	^ self attributeAt: #numberOfStatements ifAbsent: [ MooseUnavailableMetric ]
]

{ #category : 'metrics' }
FamixTWithStatements >> numberOfStatements: aNumber [
	self attributeAt: #numberOfStatements put: aNumber
]

{ #category : 'asserting' }
FamixTWithStatements >> shouldCountChildrenForLinesOfCodeIfNoSourceAnchor [
	^ false
]
