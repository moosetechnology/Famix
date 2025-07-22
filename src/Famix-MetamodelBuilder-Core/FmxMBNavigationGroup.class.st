Class {
	#name : 'FmxMBNavigationGroup',
	#superclass : 'Object',
	#instVars : [
		'name',
		'entity',
		'relation'
	],
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

{ #category : 'accessing' }
FmxMBNavigationGroup >> entity [
	^ entity
]

{ #category : 'accessing' }
FmxMBNavigationGroup >> entity: anObject [
	entity := anObject
]

{ #category : 'accessing' }
FmxMBNavigationGroup >> name [
	<ignoreForCoverage>
	^ name
]

{ #category : 'accessing' }
FmxMBNavigationGroup >> name: anObject [
	<ignoreForCoverage>
	name := anObject
]

{ #category : 'accessing' }
FmxMBNavigationGroup >> relation [
	^ relation
]

{ #category : 'accessing' }
FmxMBNavigationGroup >> relation: anObject [
	relation := anObject
]
