Class {
	#name : 'FamixMetamodelGenerateRemotePropertiesTestGeneratorXProperties',
	#superclass : 'FamixTestGenerator',
	#instVars : [
		'entityX'
	],
	#category : 'Famix-MetamodelBuilder-Tests-GeneratorRessources',
	#package : 'Famix-MetamodelBuilder-Tests',
	#tag : 'GeneratorRessources'
}

{ #category : 'accessing' }
FamixMetamodelGenerateRemotePropertiesTestGeneratorXProperties class >> packageName [

	<ignoreForCoverage>
	^ 'Famix-MetamodelBuilder-TestsResources-X-Properties'
]

{ #category : 'accessing' }
FamixMetamodelGenerateRemotePropertiesTestGeneratorXProperties class >> prefix [

	<ignoreForCoverage>
	^ #FmxTestGenerateAccessorXProperties
]

{ #category : 'accessing' }
FamixMetamodelGenerateRemotePropertiesTestGeneratorXProperties class >> submetamodels [

	^ { FamixMetamodelGenerateRemotePropertiesTestGeneratorX }
]

{ #category : 'definition' }
FamixMetamodelGenerateRemotePropertiesTestGeneratorXProperties >> defineClasses [
	super defineClasses.
	entityX := self remoteEntity: #EntityX withPrefix: #FmxTestGeneratePropertiesX
]

{ #category : 'definition' }
FamixMetamodelGenerateRemotePropertiesTestGeneratorXProperties >> defineProperties [

	super defineProperties.
	entityX property: #testProperty type: #String
]
