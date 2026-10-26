Extension { #name : 'FM3Type' }

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Type >> --|> anObject [

	^ anObject isSymbol
		  ifTrue: [ self traits add: (self builder getTraitNamed: anObject) ]
		  ifFalse: [
				  anObject isFM3Trait
					  ifTrue: [ self traits add: anObject ]
					  ifFalse: [ self superclass: anObject ] ]
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Type >> builder [

	^ self metamodel additionalProperty: #famixFameBuilder for: self
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Type >> inheritsFromTrait: tType without: aCollectionOfSelector [

	self flag: #ignoreForNow
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Type >> property: propertyName [

	^ self property: propertyName type: nil defaultValue: nil
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Type >> property: propertyName type: propertyType [

	^ self property: propertyName type: propertyType defaultValue: nil
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Type >> property: propertyName type: propertyType defaultValue: aDefaultValue [

	^ self propertyNamed: propertyName ifAbsent: [
			  | property |
			  property := FM3Property named: propertyName.
			  propertyType ifNotNil: [ property type: propertyType ].
			  aDefaultValue ifNotNil: [ property defaultValue: aDefaultValue ].
			  self properties add: property.
			  property ]
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Type >> testingSelector: aString [

	self flag: #ignoreForNow
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Type >> withEqualityCheckOn: aCollectionOfProperty [

	self flag: #ignoreForNow
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Type >> withGroup [

	self flag: #ignoreForNow
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Type >> withTesting [

	self flag: #ignoreForNow
]
