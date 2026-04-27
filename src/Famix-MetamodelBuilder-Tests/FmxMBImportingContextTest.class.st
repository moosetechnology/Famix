Class {
	#name : 'FmxMBImportingContextTest',
	#superclass : 'FmxMBTestCase',
	#instVars : [
		'access',
		'variable',
		'generatedAccess',
		'generatedVariable',
		'generatedMethod',
		'method',
		'generatedContext'
	],
	#category : 'Famix-MetamodelBuilder-Tests-Tests',
	#package : 'Famix-MetamodelBuilder-Tests',
	#tag : 'Tests'
}

{ #category : 'running' }
FmxMBImportingContextTest >> setUp [

	super setUp.

	builder withFileImport.

	access := builder newClassNamed: #Access.
	variable := builder newClassNamed: #Variable.
	method := builder newClassNamed: #Method.

	builder generate.

	generatedAccess := builder testingEnvironment ask classNamed:
		                   #TstAccess.
	generatedVariable := builder testingEnvironment ask classNamed:
		                     #TstVariable.
	generatedMethod := builder testingEnvironment ask classNamed:
		                   #TstMethod.

	generatedContext := builder testingEnvironment ask classNamed:
		                    #TstImportingContext
]

{ #category : 'tests' }
FmxMBImportingContextTest >> testGeneratedContextClass [
	self assert: generatedContext isNotNil.
	self assert: generatedContext superclass name equals: #FamixImportingContext
]

{ #category : 'tests' }
FmxMBImportingContextTest >> testNotGenerated [

	builder := FamixMetamodelBuilder forTesting.

	access := builder newClassNamed: #Access.	
	variable := builder newClassNamed: #Variable.	
	method := builder newClassNamed: #Method.

	builder generate.
		
	generatedContext := builder testingEnvironment ask classNamed: #TstImportingContext.
	self assert: generatedContext isNil.

]

{ #category : 'tests' }
FmxMBImportingContextTest >> testNotGeneratedForEmptyBuilder [

	builder := FamixMetamodelBuilder forTesting.
	builder withFileImport.

	builder generate.

	generatedContext := builder testingEnvironment ask classNamed:
		                    #TstImportingContext.
	self assert: generatedContext isNil
]
