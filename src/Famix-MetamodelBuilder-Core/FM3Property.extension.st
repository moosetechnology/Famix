Extension { #name : 'FM3Property' }

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Property >> famixIsGenerated [

	^ ((self metamodel additionalPropertiesFor: self) at: #famixHandwrittenProperty ifAbsent: [ false ]) not
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Property >> famixOpposite [

	self opposite ifNotNil: [ :opposite | ^ opposite ].
	^ (self metamodel additionalPropertiesFor: self) at: #famixDeclaredOpposite ifAbsent: [ nil ]
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Property >> isMany [

	^ self isMultivalued
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Property >> isOne [

	^ self isMultivalued not
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Property >> isRemote [

	^ self package isNotNil and: [ self package ~= self owner package ]
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Property >> oppositeName [

	^ self famixOpposite name
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Property >> oppositeSide [

	^ self famixOpposite
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Property >> oppositeType [

	^ self type famixImplementationName
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Property >> producesSlot [

	^ self isRemote not and: [ self famixOpposite isNil or: [ self famixOpposite isRemote not ] ]
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Property >> propertyType [

	^ self type famixImplementationName
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Property >> remotePackageDo: aBlock [

	self package ifNotNil: [ :package | aBlock value: package name ]
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Property >> slotDefinition [

	^ '#' , self name , ' => ' , self slotExpression
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Property >> slotExpression [

	self famixOpposite ifNil: [
		^ self defaultValue ifNil: [ 'FMProperty' ] ifNotNil: [ :value | 'FMProperty defaultValue: ' , value printString ] ].
	^ (self isMultivalued
		   ifTrue: [ 'FMMany' ]
		   ifFalse: [ 'FMOne' ]) , ' type: #' , self type famixImplementationName , ' opposite: #' , self famixOpposite name
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Property >> validate [

	self type ifNil: [ FmxMBIncompletePropertyDefiniton signal ]
]
