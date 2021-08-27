"
I represent a tuple between a model (meta-model) and the color that will be used to represent the entities of this meta-model
"
Class {
	#name : #FamixUMLModelColorTuple,
	#superclass : #Object,
	#instVars : [
		'model',
		'color'
	],
	#category : #'Famix-MetamodelDocumentor'
}

{ #category : #accessing }
FamixUMLModelColorTuple class >> model: aModel [

	^ self new
		  model: aModel;
		  yourself
]

{ #category : #accessing }
FamixUMLModelColorTuple class >> model: aModel color: aColor [

	^ self new
		  model: aModel;
		  color: aColor;
		  yourself
]

{ #category : #accessing }
FamixUMLModelColorTuple >> color [

	^ color
]

{ #category : #accessing }
FamixUMLModelColorTuple >> color: anObject [

	color := anObject
]

{ #category : #initialization }
FamixUMLModelColorTuple >> defaultColor [
	^ Color white
]

{ #category : #initialization }
FamixUMLModelColorTuple >> initialize [
	super initialize.
	color := self defaultColor
]

{ #category : #accessing }
FamixUMLModelColorTuple >> model [

	^ model
]

{ #category : #accessing }
FamixUMLModelColorTuple >> model: anObject [

	model := anObject
]
