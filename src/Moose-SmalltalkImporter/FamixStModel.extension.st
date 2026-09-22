Extension { #name : #FamixStModel }

{ #category : #'*Moose-SmalltalkImporter' }
FamixStModel >> newModelAddingAll: classesAndPackages [
	"Returns a new model with all current entities plus the requested classes and packages."

	| model task request |
	task := FamixStPharoImporterTask new
		        model: (model := self class named: name);
		        importingContext:
			        FamixStImporterContext new mergeClassAndMetaclass
				        importMaximum.

	request := (self entityStorage selectAllWithType: FamixStPackage)
		           collect: [ :famixPackage | famixPackage name asPackage ]
		           as: Set.
	request addAll: classesAndPackages.
	request do: [ :classOrPackage |
		classOrPackage isClass
			ifTrue: [ task addClass: classOrPackage ]
			ifFalse: [ task addFromPackage: classOrPackage ] ].

	task runWithProgress.
	^ model "no install: not added to root and groups not cached"
]
