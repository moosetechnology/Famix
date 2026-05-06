Extension { #name : 'MooseModel' }

{ #category : '*Moose-Query' }
MooseModel class >> factory [
	^ FMMetamodelFactory forModel: self
]

{ #category : '*Moose-Query' }
MooseModel >> factory [
	^ self class factory
]

{ #category : '*Moose-Query' }
MooseModel >> metadescription [

	^ self metadescriptionFor: self class
]

{ #category : '*Moose-Query' }
MooseModel >> metadescriptionFor: class [

	^ self metamodel fmTypeOf: class instanceSide
]
