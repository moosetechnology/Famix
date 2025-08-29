Class {
	#name : 'FamixMetamodelGenerateRemoteAccessorTestGeneratorAProperties',
	#superclass : 'FamixTestGenerator',
	#instVars : [
		'entityA'
	],
	#category : 'Famix-MetamodelBuilder-Tests-GeneratorRessources',
	#package : 'Famix-MetamodelBuilder-Tests',
	#tag : 'GeneratorRessources'
}

{ #category : 'accessing' }
FamixMetamodelGenerateRemoteAccessorTestGeneratorAProperties class >> packageName [

	<ignoreForCoverage>
	^ 'Famix-MetamodelBuilder-TestsResources-A-Properties'
]

{ #category : 'accessing' }
FamixMetamodelGenerateRemoteAccessorTestGeneratorAProperties class >> prefix [

	<ignoreForCoverage>
	^ #FmxTestGenerateAccessorAProperties
]

{ #category : 'accessing' }
FamixMetamodelGenerateRemoteAccessorTestGeneratorAProperties class >> submetamodels [

	^ { FamixMetamodelGenerateRemoteAccessorTestGeneratorA }
]

{ #category : 'definition' }
FamixMetamodelGenerateRemoteAccessorTestGeneratorAProperties >> defineClasses [
	super defineClasses.
	entityA := self remoteEntity: #EntityA withPrefix: #FmxTestGenerateAccessorA
]

{ #category : 'definition' }
FamixMetamodelGenerateRemoteAccessorTestGeneratorAProperties >> defineProperties [

	super defineProperties.
	entityA property: #testProperty type: #String
]
