Class {
	#name : #FamixMMUMLDocumentorAbstractTest,
	#superclass : #TestCase,
	#instVars : [
		'documentor',
		'stream'
	],
	#category : #'Famix-MetamodelDocumentor-tests'
}

{ #category : #running }
FamixMMUMLDocumentorAbstractTest >> famixClassFor: stClass [
	^documentor findDescriptionOf: stClass
]

{ #category : #running }
FamixMMUMLDocumentorAbstractTest >> famixProperty: aName in: stClass [
	| famixClass |
	famixClass := self famixClassFor: stClass.
	^famixClass allProperties detect: [ :p | p name = aName ]
]

{ #category : #running }
FamixMMUMLDocumentorAbstractTest >> setUp [
	String streamContents: [ :st | stream := st ] .
	documentor := FamixMMUMLDocumentor new
		model: FamixTest4Model ;
		outputStream: stream ;
		yourself.
	
]
