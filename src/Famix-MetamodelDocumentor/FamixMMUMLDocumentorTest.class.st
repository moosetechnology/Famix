Class {
	#name : #FamixMMUMLDocumentorTest,
	#superclass : #TestCase,
	#instVars : [
		'documentor',
		'stream'
	],
	#category : #'Famix-MetamodelDocumentor-tests'
}

{ #category : #running }
FamixMMUMLDocumentorTest >> famixClassFor: stClass [
	^documentor model metamodel descriptionOf: stClass
]

{ #category : #running }
FamixMMUMLDocumentorTest >> famixProperty: aName in: stClass [
	| famixClass |
	famixClass := self famixClassFor: stClass.
	^famixClass allProperties  detect: [ :p | p name = aName ]
]

{ #category : #running }
FamixMMUMLDocumentorTest >> setUp [
	String streamContents: [ :st | stream := st ] .
	documentor := FamixMMUMLDocumentor new
		model: FAMIXModel ;
		outputStream: stream ;
		yourself.
	
]

{ #category : #tests }
FamixMMUMLDocumentorTest >> testContainerIsNotRedundantRelation [

	self deny: (documentor isRedundantRelation: (self famixProperty: 'parentType' in: FAMIXMethod))
]

{ #category : #tests }
FamixMMUMLDocumentorTest >> testDerivedIsRedundantRelation [

	self assert: (documentor isRedundantRelation: (self famixProperty: 'methods' in: FAMIXClass))
]

{ #category : #tests }
FamixMMUMLDocumentorTest >> testVisitClassNoAttributes [

	documentor visitClass: (self famixClassFor: FAMIXReference).
	
	self
		assert: stream contents
		equals:
'class Reference << (C,white) >> {
}
'
]

{ #category : #tests }
FamixMMUMLDocumentorTest >> testVisitClassWithAttributes [

	documentor visitClass: (self famixClassFor: FAMIXClass).
	
	self
		assert: stream contents
		equals:
'class Class << (C,white) >> {
  Boolean isIgnored
  Boolean isInterface
}
'
]

{ #category : #tests }
FamixMMUMLDocumentorTest >> testWithoutOppositeIsNotRedundantRelation [
	"technically, this is not a relation, but it does not have opposite"
	self deny: (documentor isRedundantRelation: (self famixProperty: 'isWrite' in: FAMIXAccess))
]
