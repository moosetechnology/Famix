Extension { #name : 'MooseGroup' }

{ #category : '*Moose-Query' }
MooseGroup >> metadescription [

	^ self mooseModel
		  ifNil: [ FM3NullClass new ]
		  ifNotNil: [ :model | model metadescriptionFor: self class ]
]
