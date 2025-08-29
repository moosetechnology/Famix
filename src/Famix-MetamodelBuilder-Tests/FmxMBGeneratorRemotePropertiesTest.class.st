Class {
	#name : 'FmxMBGeneratorRemotePropertiesTest',
	#superclass : 'TestCase',
	#instVars : [
		'mm',
		'entityA'
	],
	#category : 'Famix-MetamodelBuilder-Tests-Tests',
	#package : 'Famix-MetamodelBuilder-Tests',
	#tag : 'Tests'
}

{ #category : 'accessing' }
FmxMBGeneratorRemotePropertiesTest class >> resources [
	^ { FamixGenerateRemotePropertiesTestResource }
]

{ #category : 'running' }
FmxMBGeneratorRemotePropertiesTest >> setUp [

	super setUp.
	entityA := (FamixGenerateRemotePropertiesTestResource current
		            classNamed: #FmxTestGenerateAccessorAEntityA) new
]

{ #category : 'tests' }
FmxMBGeneratorRemotePropertiesTest >> testCanSetPropertyOfEntityA [

	entityA testProperty: 'Hello World'.
	self assert: entityA testProperty equals: 'Hello World'.
	entityA testProperty: nil.
]

{ #category : 'tests' }
FmxMBGeneratorRemotePropertiesTest >> testCanUnSetPropertyOfEntityA [

	entityA testProperty: 'Hello World'.
	entityA testProperty: nil.
	self assert: entityA testProperty equals: nil
]

{ #category : 'tests' }
FmxMBGeneratorRemotePropertiesTest >> testDefaultNilPropertyOfEntityA [

	self assert: entityA testProperty equals: nil
]
