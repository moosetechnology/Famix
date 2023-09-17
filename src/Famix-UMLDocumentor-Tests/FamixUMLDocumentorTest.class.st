"
A FamixUMLDocumentorTest is a test class for testing the behavior of FamixUMLDocumentor
"
Class {
	#name : #FamixUMLDocumentorTest,
	#superclass : #TestCase,
	#instVars : [
		'documentor'
	],
	#category : #'Famix-UMLDocumentor-Tests-Generator'
}

{ #category : #running }
FamixUMLDocumentorTest >> setUp [
	super setUp.

	documentor := FamixUMLDocumentor new
]

{ #category : #tests }
FamixUMLDocumentorTest >> testColorForEntity [

	| model1 model2 |
	model1 := Mock named: #model1.
	model1 stub metamodel willReturn: model1.
	model1 stub classes willReturn: #(class1 class2).
	documentor model: model1.

	model2 := Mock named: #model2.
	model2 stub metamodel willReturn: model2.
	model2 stub classes willReturn: #(class3 class4).
	documentor model: model2.

	self assert: (documentor colorForEntity: #class1) equals: (documentor modelColors first value).
	self assert: (documentor colorForEntity: #class2) equals: (documentor modelColors first value).

	self assert: (documentor colorForEntity: #class3) equals: (documentor modelColors second value).
	self assert: (documentor colorForEntity: #class4) equals: (documentor modelColors second value).
]

{ #category : #tests }
FamixUMLDocumentorTest >> testModel [

	self assert: documentor modelColors size equals: 0.

	documentor model: #aModel.

	self assert: documentor modelColors size equals: 1.
	self assert: documentor modelColors anyOne key equals: #aModel.
	self assert: documentor modelColors anyOne value equals: Color white.
]

{ #category : #tests }
FamixUMLDocumentorTest >> testSeveralModels [

	self assert: documentor modelColors size equals: 0.

	documentor model: #model1.
	self assert: documentor modelColors size equals: 1.

	documentor model: #model2.
	self assert: documentor modelColors size equals: 2.
	self deny: documentor modelColors first value equals: documentor modelColors second value.

	documentor model: #model3.
	self assert: documentor modelColors size equals: 3.
	self deny: documentor modelColors first value equals: documentor modelColors third value.
	self deny: documentor modelColors second value equals: documentor modelColors third value.

]
