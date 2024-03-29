Class {
	#name : #FamixMethodTest,
	#superclass : #FamixTest1SimpleModelTest,
	#category : #'Famix-Test1-Tests'
}

{ #category : #tests }
FamixMethodTest >> testBelongsTo [
	self assert: m1 belongsTo equals: c1
]

{ #category : #tests }
FamixMethodTest >> testComputeNumberOfLinesOfCode [

	| withoutSource |
	
	self assert: m1 computeNumberOfLinesOfCode equals: 2.
	self assert: m2 computeNumberOfLinesOfCode equals: 3.

	withoutSource := FamixTest1Method named: #withoutSource.
	self assert: withoutSource computeNumberOfLinesOfCode equals: model notExistentMetricValue
]

{ #category : #tests }
FamixMethodTest >> testCyclomaticComplexity [

	self assert: m1 cyclomaticComplexity equals: model notExistentMetricValue.
	m1 cyclomaticComplexity: 100.
	self assert: m1 cyclomaticComplexity equals: 100.

]

{ #category : #tests }
FamixMethodTest >> testIsClass [

	self assert: c1 isClass. 	
	self assert: c2 isClass. 
	self deny: m1 isClass.
	self deny: m2 isClass.
	self deny: anchor1 isClass.
	self deny: anchor2 isClass.
]

{ #category : #tests }
FamixMethodTest >> testIsClassSide [

	m1 isClassSide: true.
	self assert: m1 isClassSide .

]

{ #category : #tests }
FamixMethodTest >> testIsConstant [

	self deny: m1 isConstant.
	m1 beConstant.
	self assert: m1 isConstant.

]

{ #category : #tests }
FamixMethodTest >> testIsConstructor [

	self deny: m1 isConstructor.
	m1 isConstructor: true.
	self assert: m1 isConstructor.

]

{ #category : #tests }
FamixMethodTest >> testIsGetter [

	self deny: m1 isGetter.
	m1 beGetter.
	self assert: m1 isGetter.

]

{ #category : #tests }
FamixMethodTest >> testIsMethod [

	self assert: m1 isMethod.
	self deny: c1 isMethod.
]

{ #category : #tests }
FamixMethodTest >> testIsPureAccessor [

	self deny: m1 isPureAccessor.
	m1 beGetter.
	self assert: m1 isPureAccessor.
	m1 beSetter.
	self assert: m1 isPureAccessor.

]

{ #category : #tests }
FamixMethodTest >> testIsSetter [

	self deny: m1 isSetter.
	m1 beSetter.
	self assert: m1 isSetter.

]

{ #category : #tests }
FamixMethodTest >> testKind [

	m1 beConstant.
	self assert: m1 kind equals: #constant.

]

{ #category : #tests }
FamixMethodTest >> testNumberOfLinesOfCode [

	self assert: m1 numberOfLinesOfCode equals: 2.
	self assert: m2 numberOfLinesOfCode equals: 3.
	m1 numberOfLinesOfCode: 100.
	self assert: m1 numberOfLinesOfCode equals: 100.
	


]

{ #category : #tests }
FamixMethodTest >> testParentType [

	self assertCollection: m1 parentType equals: c1.
	self assertCollection: m2 parentType equals: c2.
]

{ #category : #tests }
FamixMethodTest >> testParentTypeIsStub [

	self deny: m1 parentTypeIsStub.
	c1 stub: true.
	self assert: m1 parentTypeIsStub.

]

{ #category : #tests }
FamixMethodTest >> testRelations [

	self assertCollection: c1 methods hasSameElements:  { m1 }.	
	self assertCollection: c2 methods hasSameElements:  { m2. m3 }.
	self assertCollection: m1 parentType equals: c1.
	self assertCollection: m2 parentType equals: c2.
]
