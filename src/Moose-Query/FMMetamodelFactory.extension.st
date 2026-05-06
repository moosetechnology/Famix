Extension { #name : 'FMMetamodelFactory' }

{ #category : '*Moose-Query' }
FMMetamodelFactory class >> forModel: aModel [

	^ (self allFactories
		   detect: [ :factory | factory isDefaultFor: aModel ]
		   ifFound: [ :factory | factory ]
		   ifNone: [ self ]) new
		  forModel: aModel;
		  yourself
]

{ #category : '*Moose-Query' }
FMMetamodelFactory >> forModel: aModel [

	fm3Package := aModel metadescription package
]
