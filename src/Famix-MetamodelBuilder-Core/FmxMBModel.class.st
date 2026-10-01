Class {
	#name : #FmxMBModel,
	#superclass : #FmxMBClass,
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #visitor }
FmxMBModel >> acceptVisitor: aVisitor [

	^ aVisitor visitModel: self
]

{ #category : #'settings - default' }
FmxMBModel >> defaultSuperclassName [

	^ #MooseModel
]

{ #category : #'settings - default' }
FmxMBModel >> defaultTag [

	^ #Model
]

{ #category : #testing }
FmxMBModel >> isModelClass [

	^ true
]

{ #category : #accessing }
FmxMBModel >> name [
	^ super name ifNil: [ #'Model' ]
]
