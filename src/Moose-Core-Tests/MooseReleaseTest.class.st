Class {
	#name : #MooseReleaseTest,
	#superclass : #TestCase,
	#category : #'Moose-Core-Tests'
}

{ #category : #tests }
MooseReleaseTest >> testFamixUsesNewFamePragmas [
	"Fame pragma changed but the old ones are still usable for a transition periode. The goal of this test is to ensure we do not use them anymore.
	This could probably be removed in the future when Fame will remove the deprecated pragmas."

	#(#MSEClass:super: #MSEComment: #MSEProperty:type: #MSEProperty:type:opposite:)
		do: [ :each | 
			| collector |
			collector := (PragmaCollector filter: [ :prg | prg selector = each ]) reset.
			self assertEmpty: collector collected ]
]
