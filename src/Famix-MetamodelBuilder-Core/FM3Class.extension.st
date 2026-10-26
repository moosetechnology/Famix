Extension { #name : 'FM3Class' }

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Class >> isAbstractClass [

	^ self isAbstract
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Class >> isAbstractClass: aBoolean [

	^ self isAbstract: aBoolean
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Class >> source: anotherType [

	(self property: (anotherType name copyWithoutFirst: $T) uncapitalized)
		source
	*- (anotherType property: #outgoing , self name asEnglishPlural)
]

{ #category : '*Famix-MetamodelBuilder-Core' }
FM3Class >> target: anotherType [

	(self property: (anotherType name copyWithoutFirst: $T) uncapitalized)
		target
	*- (anotherType property: #incoming , self name asEnglishPlural)
]
