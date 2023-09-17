"
I'm a micro visitor who takes care of distinguishing inheritance for classes and traits.
That is, trait inheritance is actually a use.

I print, therefore, the inheritance or use of the class or trait in the stream.

I am called by the main visitor, FamixMMUMLDocumentor, in its generatePlantUMLInheritance method.
"
Class {
	#name : #FamixMMUMLInheritanceDocumentor,
	#superclass : #FamixMMUMLAbstractDocumentor,
	#category : #'Famix-MetamodelDocumentor'
}

{ #category : #visiting }
FamixMMUMLInheritanceDocumentor >> visitClass: aFMClass [

	| aFMSuperClass |
	aFMSuperClass := aFMClass superclass.
	(self relationEndOfInterest: aFMClass) ifFalse: [ ^ self ].
	(self relationEndOfInterest: aFMSuperClass) ifFalse: [ ^ self ].
	self generateClassName: aFMSuperClass.
	outputStream nextPutAll: ' <|-- '.
	self generateClassName: aFMClass.
	outputStream cr.
	aFMClass implementingClass traits
		collect: [ :stClass | self findDescriptionOf: stClass ]
		thenDo: [ :aTrait | self visitUsedTrait: aTrait byClass: aFMClass ]
]

{ #category : #visiting }
FamixMMUMLInheritanceDocumentor >> visitTrait: aFMTrait [

	self flag: 'Hack to access to direct traits only - https://github.com/moosetechnology/Fame/issues/23'.
	(aFMTrait implementingClass traits collect: [ :stClass | self findDescriptionOf: stClass ]) do: [ :aFMSuperTrait |
		(self relationEndOfInterest: aFMTrait) ifFalse: [ ^ self ].
		(self relationEndOfInterest: aFMSuperTrait) ifFalse: [ ^ self ].
		self generateClassName: aFMSuperTrait.
		outputStream nextPutAll: ' <|.. '.
		self generateClassName: aFMTrait.
		outputStream cr ]
]

{ #category : #visiting }
FamixMMUMLInheritanceDocumentor >> visitUsedTrait: aTrait byClass: aFMClass [

	(self relationEndOfInterest: aTrait) ifFalse: [ ^ self ].
	(self relationEndOfInterest: aTrait) ifFalse: [ ^ self ].

	self generateClassName: aTrait.
	outputStream nextPutAll: ' <|.. '.
	self generateClassName: aFMClass.
	outputStream cr
]
