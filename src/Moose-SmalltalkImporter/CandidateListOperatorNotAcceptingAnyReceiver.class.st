"
a CandidateListOperatorNotAcceptingAnyReceiver doesn't compute any possible type.
"
Class {
	#name : 'CandidateListOperatorNotAcceptingAnyReceiver',
	#superclass : 'AbstractCandidateListOperator',
	#category : 'Moose-SmalltalkImporter-Operators',
	#package : 'Moose-SmalltalkImporter',
	#tag : 'Operators'
}

{ #category : 'running' }
CandidateListOperatorNotAcceptingAnyReceiver >> computeCandidateListFor: anInvocation [ 

	anInvocation candidates: {}.
]
