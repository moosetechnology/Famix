Class {
	#name : #FamixJavaFusionnerTest,
	#superclass : #TestCase,
	#instVars : [
		'resourceModel',
		'consumerModel',
		'fusionner'
	],
	#category : #'FamixFusionner-Tests'
}

{ #category : #running }
FamixJavaFusionnerTest >> setUp [
	super setUp.

	resourceModel := FamixJavaModel new name: 'resourceModel'.
	consumerModel := FamixJavaModel new name: 'consumerModel'.
	fusionner := FamixFusionnerJava new
		resourceModel: resourceModel ;
		consumerModel: consumerModel 
]

{ #category : #tests }
FamixJavaFusionnerTest >> testOneEntityFusion [

	(resourceModel newClassNamed: 'Blah') isStub: false.
	(consumerModel newClassNamed: 'Blah') isStub: true.

	fusionner fusion.

	self assert: consumerModel size equals: 1.
	self deny: consumerModel anyOne isStub.
	self assert: consumerModel anyOne equals: resourceModel anyOne
]
