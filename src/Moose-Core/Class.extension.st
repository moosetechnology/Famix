Extension { #name : #Class }

{ #category : #'*Moose-Core' }
Class >> allMatchingSelfIn: aMooseModel [ 
	^ aMooseModel allWithType: self
]
