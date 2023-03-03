Class {
	#name : #FmxMBImportingContextTest,
	#superclass : #FmxMBTestCase,
	#instVars : [
		'access',
		'variable',
		'generatedAccess',
		'generatedVariable',
		'generatedMethod',
		'method',
		'generatedContext'
	],
	#category : #'Famix-MetamodelBuilder-Tests'
}

{ #category : #running }
FmxMBImportingContextTest >> setUp [

	super setUp.

	builder withImportingContext.

	access := builder newClassNamed: #Access.	
	variable := builder newClassNamed: #Variable.	
	method := builder newClassNamed: #Method.

	builder generate.
		
	generatedAccess := builder testingEnvironment ask classNamed: #TstAccess.
	generatedVariable := builder testingEnvironment ask classNamed: #TstVariable.
	generatedMethod := builder testingEnvironment ask classNamed: #TstMethod.

	generatedContext := builder testingEnvironment ask classNamed: #TstImportingContext.

]

{ #category : #tests }
FmxMBImportingContextTest >> testDefineImport [

	| localMethod |
	localMethod := generatedContext methodNamed: #importMethod.
	self assert:
		(localMethod sourceCode includesSubstring: '<generated>').
	self assert: (localMethod sourceCode includesSubstring:
			 'self importConcreteEntity: (self class fm3ClassNamed: #Method')
]

{ #category : #tests }
FmxMBImportingContextTest >> testGeneratedContextClass [
	self assert: generatedContext isNotNil.
	self assert: generatedContext superclass name equals: #FmxImportingContext
]

{ #category : #tests }
FmxMBImportingContextTest >> testNotGenerated [

	builder := FamixMetamodelBuilder forTesting.

	access := builder newClassNamed: #Access.	
	variable := builder newClassNamed: #Variable.	
	method := builder newClassNamed: #Method.

	builder generate.
		
	generatedContext := builder testingEnvironment ask classNamed: #TstImportingContext.
	self assert: generatedContext isNil.

]

{ #category : #tests }
FmxMBImportingContextTest >> testNotGeneratedForEmptyBuilder [

	builder := FamixMetamodelBuilder forTesting.
	builder withImportingContext.

	builder generate.
		
	generatedContext := builder testingEnvironment ask classNamed: #TstImportingContext.
	self assert: generatedContext isNil.

]

{ #category : #tests }
FmxMBImportingContextTest >> testShouldImport [

	| localMethod |
	
	localMethod := generatedContext methodNamed: #shouldImportMethod.
	self assert: (localMethod sourceCode includesSubstring: '<generated>').
	self assert: (localMethod sourceCode includesSubstring: '^ self shouldImport: #Method').
	
	localMethod := generatedContext methodNamed: #shouldImportAccess.
	self assert: (localMethod sourceCode includesSubstring: '<generated>').
	self assert: (localMethod sourceCode includesSubstring: '^ self shouldImport: #Access').
	
	localMethod := generatedContext methodNamed: #shouldImportVariable.
	self assert: (localMethod sourceCode includesSubstring: '<generated>').
	self assert: (localMethod sourceCode includesSubstring: '^ self shouldImport: #Variable').

]
