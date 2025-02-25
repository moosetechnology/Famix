Class {
	#name : #FamixExtensionMetamodelBuilder,
	#superclass : #Object,
	#instVars : [
		'metamodelBuilder',
		'configuration'
	],
	#category : #'Famix-MetamodelBuilder-Core-Basic'
}

{ #category : #accessing }
FamixExtensionMetamodelBuilder >> configuration [

	^ configuration ifNil: [
		  configuration := self defaultConfigurationClass new ]
]

{ #category : #default }
FamixExtensionMetamodelBuilder >> defaultConfigurationClass [

	self subclassResponsibility
]

{ #category : #accessing }
FamixExtensionMetamodelBuilder >> metamodelBuilder: aMetamodelBuilder [

	metamodelBuilder := aMetamodelBuilder
]

{ #category : #generating }
FamixExtensionMetamodelBuilder >> prepareGeneration [

	self subclassResponsibility
]

{ #category : #generating }
FamixExtensionMetamodelBuilder >> registerPackages [

	self subclassResponsibility
]
