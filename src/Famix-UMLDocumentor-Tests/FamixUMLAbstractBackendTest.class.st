Class {
	#name : 'FamixUMLAbstractBackendTest',
	#superclass : 'TestCase',
	#instVars : [
		'backend'
	],
	#category : 'Famix-UMLDocumentor-Tests-Tests',
	#package : 'Famix-UMLDocumentor-Tests',
	#tag : 'Tests'
}

{ #category : 'testing' }
FamixUMLAbstractBackendTest class >> isAbstract [

	^ self = FamixUMLAbstractBackendTest
]

{ #category : 'accessing' }
FamixUMLAbstractBackendTest >> backendClass [

	self subclassResponsibility
]

{ #category : 'running' }
FamixUMLAbstractBackendTest >> classNamed: aString [

	^FamixUMLClass new
		name: aString ;
		color: Color white ;
		yourself
]

{ #category : 'running' }
FamixUMLAbstractBackendTest >> link: aLink from: className to: superClassName [

	^aLink new
		source: className ;
		target: superClassName ;
		yourself
]

{ #category : 'running' }
FamixUMLAbstractBackendTest >> property: aName type: aString [

	^FamixUMLProperty new
		name: aName ;
		type: aString ;
		yourself
]

{ #category : 'running' }
FamixUMLAbstractBackendTest >> setUp [

	super setUp.

	backend := self backendClass new
]
