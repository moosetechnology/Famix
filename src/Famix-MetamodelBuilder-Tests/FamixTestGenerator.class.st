Class {
	#name : 'FamixTestGenerator',
	#superclass : 'FamixMetamodelGenerator',
	#category : 'Famix-MetamodelBuilder-Tests-GeneratorRessources',
	#package : 'Famix-MetamodelBuilder-Tests',
	#tag : 'GeneratorRessources'
}

{ #category : 'testing' }
FamixTestGenerator class >> isAbstract [

	^ self = FamixTestGenerator
]

{ #category : 'testing' }
FamixTestGenerator class >> isRealMetamodel [
	^ false
]
