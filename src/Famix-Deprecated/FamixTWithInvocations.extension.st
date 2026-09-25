Extension { #name : 'FamixTWithInvocations' }

{ #category : '*Famix-Deprecated' }
FamixTWithInvocations >> outgoingInvocationsGroup [

	self deprecated:
		'This method was used in old Moose interfaces but is not used anymore and is probably dead code. If you use it, contact the Moose team to ask the removal of the deprecation.'.

	^ self
		  cacheAt: #outgoingInvocationsGroup
		  ifAbsentPut: [ MooseGroup withAll: self outgoingInvocations withDescription: 'Outgoing invocations from ' , self mooseName ]
]
