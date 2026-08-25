Extension { #name : 'FamixGlobalVariableGroup' }

{ #category : '*Famix-Deprecated' }
FamixGlobalVariableGroup >> variableUnusedGroup [

	self deprecated:
		'This method was used in old Moose interfaces but is not used anymore and is probably dead code. If you use it, contact the Moose team to ask the removal of the deprecation.'.

	^ self class withAll: self variableUnused
]

{ #category : '*Famix-Deprecated' }
FamixGlobalVariableGroup >> variablesAccessedFromDifferentPackagesGroup [
	"Variables accessed from more than one package"

	self deprecated:
		'This method was used in old Moose interfaces but is not used anymore and is probably dead code. If you use it, contact the Moose team to ask the removal of the deprecation.'.
	^ self class withAll: self variablesAccessedFromDifferentPackages
]
