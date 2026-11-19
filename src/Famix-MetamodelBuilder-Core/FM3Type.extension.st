Extension { #name : 'FM3Type' }

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Type >> famixImplementationName [

	self metamodel ifNil: [ ^ self name ].
	^ (self metamodel additionalPropertiesFor: self) at: #famixImplementationName ifAbsent: [ self name ]
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Type >> famixTraitDefinitions [

	| exclusions |
	exclusions := (self metamodel additionalPropertiesFor: self) at: #famixTraitExclusions ifAbsent: [ Dictionary new ].
	^ (self traits sorted: #famixImplementationName ascending) collect: [ :trait |
			  exclusions
				  at: trait famixImplementationName
				  ifPresent: [ :selectors |
				  '(' , trait famixImplementationName , ' - {' , ('. ' join: (selectors collect: #printString)) , '})' ]
				  ifAbsent: [ trait famixImplementationName ] ]
]
