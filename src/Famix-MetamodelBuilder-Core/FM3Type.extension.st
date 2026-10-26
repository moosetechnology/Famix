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

	^ self metamodel additionalProperty: #famixFamelBuilder for: self
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Type >> testingSelector: aString [

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
