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

	self assert: config navigationForContainers.
	config navigationForContainers: false.
	self deny: config navigationForContainers.

	self deny: config navigationForNonContainers.
	config navigationForNonContainers: true.
	self assert: config navigationForNonContainers.

	self deny: config shouldGenerateFileImportHelpers.
	config shouldGenerateFileImportHelpers: true.
	self assert: config shouldGenerateFileImportHelpers
]
