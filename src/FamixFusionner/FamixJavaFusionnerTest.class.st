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
FamixJavaFusionnerTest >> attribute: attributeName class: className [

	(resourceModel newAttributeNamed: attributeName)
		isStub: false ;
		parentType: (resourceModel entityNamed: className).
	(consumerModel newAttributeNamed: attributeName)
		isStub: true ;
		parentType: (consumerModel entityNamed: className).

]

{ #category : #running }
FamixJavaFusionnerTest >> class: aName [

	(resourceModel newClassNamed: aName) isStub: false.
	(consumerModel newClassNamed: aName) isStub: true.

]

{ #category : #running }
FamixJavaFusionnerTest >> inheritanceFrom: subName to: superName [
	"note: Associations don't have a #isStub property"

	resourceModel newInheritance
		subclass: (resourceModel entityNamed: subName) ;
		superclass: (resourceModel entityNamed: superName).
	consumerModel newInheritance
		subclass: (consumerModel entityNamed: subName) ;
		superclass: (consumerModel entityNamed: superName)
]

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
FamixJavaFusionnerTest >> testClassWithStubInheritance [

	self class: 'Blah'.
	self class: 'SuperBlah'.
	self inheritanceFrom: 'Blah' to: 'SuperBlah'.

	self assert: consumerModel size equals: 3.
	self assert: resourceModel size equals: 3.
	
	fusionner fusion.

	self assert: consumerModel size equals: 0.
	self assert: resourceModel size equals: 3.
]

{ #category : #tests }
FamixJavaFusionnerTest >> testStubClass [

	self class: 'Blah'.
	fusionner fusion.

	self assert: consumerModel size equals: 0.
	self assert: resourceModel size equals: 1.
]

{ #category : #tests }
FamixJavaFusionnerTest >> testStubClassAndAttribute [

	self class: 'Blah'.
	self attribute: 'att1' class: 'Blah'.

	self assert: consumerModel size equals: 2.
	self assert: resourceModel size equals: 2.
	
	fusionner fusion.

	self assert: consumerModel size equals: 0.
	self assert: resourceModel size equals: 2.
]

{ #category : #tests }
FamixJavaFusionnerTest >> testStubInheritance [
	"real class with inheritance to stub class"

	self class: 'SuperBlah'.
	(consumerModel newClassNamed: 'Blah') isStub: false.
	consumerModel newInheritance
		isStub: false ;
		superclass: (consumerModel entityNamed: 'SuperBlah') ;
		subclass: (consumerModel entityNamed: 'Blah').

	self assert: consumerModel size equals: 3.
	self assert: resourceModel size equals: 1.

	fusionner fusion.

	self assert: consumerModel size equals: 2.
	self assert: resourceModel size equals: 1.

	self
		assert: (consumerModel entityNamed: 'Blah') superclass
		equals: (resourceModel entityNamed: 'SuperBlah')
]

{ #category : #tests }
FamixJavaFusionnerTest >> testVariableWithStubDeclaredType [
	"real class with inheritance to stub class"

	self class: 'Blah'.
	self variable: 'var' declaredType: 'Blah'.
	(consumerModel entityNamed: 'var') stub: false.

	self assert: consumerModel size equals: 2.
	self assert: resourceModel size equals: 2.

	fusionner fusion.

	self assert: consumerModel size equals: 1.
	self assert: resourceModel size equals: 2.

	self
		assert: (consumerModel entityNamed: 'var') declaredType
		equals: (resourceModel entityNamed: 'Blah')
]

{ #category : #running }
FamixJavaFusionnerTest >> variable: aName [

	(resourceModel newLocalVariableNamed: aName) isStub: false.
	(consumerModel newLocalVariableNamed: aName) isStub: true.

]

{ #category : #running }
FamixJavaFusionnerTest >> variable: varName declaredType: typeName [

	(resourceModel newLocalVariableNamed: varName)
		isStub: false ;
		declaredType: (resourceModel entityNamed: typeName).
	(consumerModel newLocalVariableNamed: varName)
		isStub: true ;
		declaredType: (consumerModel entityNamed: typeName).

]
