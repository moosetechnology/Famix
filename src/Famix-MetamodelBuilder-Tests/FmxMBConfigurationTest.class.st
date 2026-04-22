Class {
	#name : 'FmxMBConfigurationTest',
	#superclass : 'FmxMBTestCase',
	#category : 'Famix-MetamodelBuilder-Tests-Tests',
	#package : 'Famix-MetamodelBuilder-Tests',
	#tag : 'Tests'
}

{ #category : 'tests' }
FmxMBConfigurationTest >> testConfiguration [
	| config |
	config := builder configuration.

	self assert: config isNotNil.

	self deny: config shouldGenerateFileImportHelpers.
	config shouldGenerateFileImportHelpers: true.
	self assert: config shouldGenerateFileImportHelpers
]
