Extension { #name : 'FamixJavaSourcedEntity' }

{ #category : '*Famix-Deprecated' }
FamixJavaSourcedEntity >> numberOfJavaNullChecks [

	<FMProperty: #numberOfJavaNullChecks type: #Number>
	<derived>
	self deprecated: 'This method is too specific to be part of the core of Moose without knowing if it can be of use to someone.
	If you use it, please open an issue on the Famix github to explain your purpose.'.
	^ self cacheAt: #numberOfJavaNullChecks ifAbsentPut: [ (self sourceText allRegexMatches: '== null|!= null|null ==|null !=') size ]
]
