Class {
	#name : 'FamixGlobalVariableGroup',
	#superclass : 'MooseSpecializedGroup',
	#category : 'Famix-Traits-Groups',
	#package : 'Famix-Traits',
	#tag : 'Groups'
}

{ #category : 'accessing' }
FamixGlobalVariableGroup >> variableNamed: aVarName [
	"Maybe mooseName should be used instead"
	^ self detect: [:var | var name = aVarName ]
]

{ #category : 'accessing' }
FamixGlobalVariableGroup >> variableUnused [

	^ self select: [ :var | var incomingAccesses isEmpty ]
]

{ #category : 'accessing' }
FamixGlobalVariableGroup >> variablesAccessedFromDifferentPackages [

	^ self select: [ :var | ((var incomingAccesses collect: #accessor) collect: #parentScope) asSet size > 1 ]
]
