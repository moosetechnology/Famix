Class {
	#name : #FamixTestGenerator,
	#superclass : #FamixMetamodelGenerator,
	#category : #'Famix-MetamodelBuilder-Tests-GeneratorRessources'
}

{ #category : #testing }
FamixTestGenerator class >> isAbstract [

	^ self = FamixTestGenerator
]

{ #category : #testing }
FamixTestGenerator class >> isRealMetamodel [
	^ false
]
