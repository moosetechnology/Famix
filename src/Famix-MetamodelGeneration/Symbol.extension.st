Extension { #name : #Symbol }

{ #category : #'*Famix-MetamodelGeneration' }
Symbol >> *- aProperty [
	"this is intended to be used in a FamixGenerator in conjunction with FmxMBBehavior >> source:target:"

	^{ self . #manyToOne: . aProperty }
]

{ #category : #'*Famix-MetamodelGeneration' }
Symbol >> *-* aProperty [
	"this is intended to be used in a FamixGenerator in conjunction with FmxMBBehavior >> source:target:"

	^{ self . #manyToMany: . aProperty }
]

{ #category : #'*Famix-MetamodelGeneration' }
Symbol >> - aProperty [
	"this is intended to be used in a FamixGenerator in conjunction with FmxMBBehavior >> source:target:"

	^{ self . #oneToOne: . aProperty }
]

{ #category : #'*Famix-MetamodelGeneration' }
Symbol >> -* aProperty [
	"this is intended to be used in a FamixGenerator in conjunction with FmxMBBehavior >> source:target:"

	^{ self . #oneToMany: . aProperty }
]
