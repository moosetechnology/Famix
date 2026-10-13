Extension { #name : 'MooseModel' }

{ #category : '*Moose-Importers' }
MooseModel class >> possibleModelsToImportFromFiles [

	^ self withAllSubclasses reject: [ :model | model isDeprecated or: [ model canBeImportedFromFile not ] ]
]
