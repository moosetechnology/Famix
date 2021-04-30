"
FAMIXMethod represents a behaviour in an object-oriented language.

A FAMIXMethod is always contained in a parentType.
"
Trait {
	#name : #FamixTMethod,
	#instVars : [
		'#parentType => FMOne type: #FamixTWithMethods opposite: #methods'
	],
	#traits : '(FamixTCanBeClassSide + FamixTHasClassScope + FamixTHasSignature + FamixTInvocable + FamixTNamedEntity + FamixTTypedEntity + FamixTWithImplicitVariables + FamixTWithLocalVariables + FamixTWithParameters + FamixTWithStatements + TOODependencyQueries withPrecedenceOf: FamixTWithStatements)',
	#classTraits : '(FamixTCanBeClassSide classTrait + FamixTHasClassScope classTrait + FamixTHasSignature classTrait + FamixTInvocable classTrait + FamixTNamedEntity classTrait + FamixTTypedEntity classTrait + FamixTWithImplicitVariables classTrait + FamixTWithLocalVariables classTrait + FamixTWithParameters classTrait + FamixTWithStatements classTrait + TOODependencyQueries classTrait withPrecedenceOf: FamixTWithStatements classTrait)',
	#category : #'Famix-Traits-Behavioral'
}

{ #category : #meta }
FamixTMethod classSide >> annotation [

	<FMClass: #TMethod super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #groups }
FamixTMethod classSide >> annotationFamixMethodGroup [
	<generated>
	<mooseGroup>
	^ FamixMethodGroup
]

{ #category : #metrics }
FamixTMethod >> hierarchyNestingLevel [
	<FMProperty: #hierarchyNestingLevel type: #Number>
	<derived>
	<FMComment: 'The nesting level in the hierarchy'>
	
	^self
		lookUpPropertyNamed: #hierarchyNestingLevel
		computedAs: [self belongsTo hierarchyNestingLevel]
]

{ #category : #metrics }
FamixTMethod >> hierarchyNestingLevel: aNumber [
	self cacheAt: #hierarchyNestingLevel put: aNumber
]

{ #category : #testing }
FamixTMethod >> isMethod [

	<generated>
	^ true
]

{ #category : #printing }
FamixTMethod >> mooseNameOn: stream [
	self parentType
		ifNotNil: [ :parent | 
			parent mooseNameOn: stream.
			stream nextPut: $. ].
	self signature
		ifNotNil: [ :aSignature | stream nextPutAll: aSignature ]
		ifNil: [ self name ifNotNil: [ :aName | stream nextPutAll: aName ] ]
]

{ #category : #metrics }
FamixTMethod >> numberOfMessageSends [
	<FMProperty: #numberOfMessageSends type: #Number>
	<derived>
	<FMComment: 'The number of message from a method'>
	^ self
		lookUpPropertyNamed: #numberOfMessageSends
		computedAs: [ self notExistentMetricValue ]
]

{ #category : #metrics }
FamixTMethod >> numberOfMessageSends: aNumber [
	self cacheAt: #numberOfMessageSends put: aNumber
]

{ #category : #accessing }
FamixTMethod >> parentType [
	"Relation named: #parentType type: #FamixTWithMethods opposite: #methods"

	<generated>
	<FMComment: 'Type declaring the method. It provides the implementation for belongsTo.'>
	<container>
	^ parentType
]

{ #category : #accessing }
FamixTMethod >> parentType: anObject [

	parentType := anObject.
	self resetMooseName.

]

{ #category : #navigation }
FamixTMethod >> parentTypeGroup [
	<generated>
	<navigation: 'ParentType'>
	^ MooseSpecializedGroup with: self parentType
]

{ #category : #testing }
FamixTMethod >> parentTypeIsStub [

	^ self parentType ifNotNil: [ :e | e isStub ] ifNil: [ true ]
]
