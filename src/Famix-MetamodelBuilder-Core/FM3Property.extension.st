Extension { #name : 'FM3Property' }

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Property >> *- aFM3Property [

	self opposite: aFM3Property
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Property >> *-* aFM3Property [

	self opposite: aFM3Property
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Property >> *-<> aFM3Property [

	self opposite: aFM3Property
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Property >> - aFM3Property [

	self opposite: aFM3Property
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Property >> -* aFM3Property [

	self opposite: aFM3Property
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Property >> -<> aFM3Property [

	self opposite: aFM3Property
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Property >> <>-* aFM3Property [

	self opposite: aFM3Property
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Property >> multivalued [

	^ self isMultivalued: true
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Property >> source [

	^ self isSource: true
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Property >> target [
	self isTarget: true
]
