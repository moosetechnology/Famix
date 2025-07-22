Class {
	#name : 'FmxMBTestCase',
	#superclass : 'TestCase',
	#instVars : [
		'builder'
	],
	#category : 'Famix-MetamodelBuilder-Tests-Tests',
	#package : 'Famix-MetamodelBuilder-Tests',
	#tag : 'Tests'
}

{ #category : 'running' }
FmxMBTestCase >> setUp [

	super setUp.
	builder := FamixMetamodelBuilder forTesting.

]
