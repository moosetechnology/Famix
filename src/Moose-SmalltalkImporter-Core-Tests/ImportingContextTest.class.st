Class {
	#name : #ImportingContextTest,
	#superclass : #TestCase,
	#category : #'Moose-SmalltalkImporter-Core-Tests'
}

{ #category : #tests }
ImportingContextTest >> testAllDependentsOf [

	| res1 res2 |
	FamixStImporterContext initialize.
	res1 := FamixStImporterContext new allDependentsOf: FamixStImporterContext importingClass.
	self assert: res1 size equals: 2.
	self assert: (res1 includes: FamixStImporterContext importingClass).
	res2 := FamixStImporterContext new allDependentsOf: FamixStImporterContext importingImplicitVariable.
	self assert: res2 size equals: 4.
	self assert: (res2 includes: FamixStImporterContext importingClass).
	self assert: (res2 includes: FamixStImporterContext importingMethod).
	self assert: (res2 includes: FamixStImporterContext importingImplicitVariable)
]

{ #category : #tests }
ImportingContextTest >> testShouldComputeTypeOfAttributes [
	| context |

	context :=FamixStImporterContext new.
	self deny: (context shouldComputeTypeOfAttributes).
	context computeTypeOfAttributes.
	self assert: (context shouldComputeTypeOfAttributes).
]

{ #category : #tests }
ImportingContextTest >> testShouldImportAllTheRest [

	| context |
	context := FamixStImporterContext new.
	context
		importClass;
		importMethod;
		importInheritance.
	self deny: context shouldImportMethodBody.
	self assert: context shouldImportClass
]

{ #category : #tests }
ImportingContextTest >> testShouldImportClasses [

	| context |
	context := FamixStImporterContext new.
	context importClass.
	self assert: context shouldImportClass
]

{ #category : #tests }
ImportingContextTest >> testShouldImportClassesForInheritance [
	"when I extract inheritance I should also extract the dependents of inheritance, here class
	please see that this test is generic and that we can change the dependencies between 
	entities without breaking it"
	
	| context |
	context :=FamixStImporterContext new.
	context importInheritance.
	(context class entityDependencies at: context class importingInheritance)
		do: [:each | self assert: (context shouldImport: each)]
]

{ #category : #tests }
ImportingContextTest >> testShouldImportClassesForMethod [

	| context |
	context := FamixStImporterContext new.
	context importMethod.
	self assert: context shouldImportClass
]

{ #category : #tests }
ImportingContextTest >> testShouldImportMethodBody [
	
	| context |
	context :=FamixStImporterContext new.
	context importArgument.
	self assert: (context shouldImportMethodBody).
]

{ #category : #tests }
ImportingContextTest >> testShouldImportMethodBody2 [
	
	| context |
	context :=FamixStImporterContext new.
	context importImplicitVariable.

	self assert: (context shouldImportMethodBody).
]

{ #category : #tests }
ImportingContextTest >> testShouldImportMethodBodyBasedOnMaximum [
	
	| context |
	context :=FamixStImporterContext new.
	context importMaximum.
	
	self assert: (context shouldImportMethodBody).
]
