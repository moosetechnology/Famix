Class {
	#name : #FamixMetamodelChecks,
	#superclass : #Object,
	#instVars : [
		'errors'
	],
	#category : #'Famix-Metamodel-Checks'
}

{ #category : #running }
FamixMetamodelChecks class >> checkMetamodel: aMetaModelClass [

	^self new
		checkMetamodel: aMetaModelClass
]

{ #category : #running }
FamixMetamodelChecks >> checkMetamodel: aMetaModelClass [

	| fmMetamodel |
	errors := OrderedCollection new.

	fmMetamodel := aMetaModelClass asMooseDescription metamodel.
	fmMetamodel classes do: [ :aFMClass |
		(self checkRelationsOf: aFMClass inMetamodel: fmMetamodel)
	].

	^errors
]

{ #category : #running }
FamixMetamodelChecks >> checkOppositeOf: aFM3Property existInMetamodel: aFMMetaModel [ 

	| oppositeType |
	oppositeType := aFM3Property opposite type.
	^oppositeType isFM3Trait
		ifTrue: [ self trait: oppositeType implementingClass	usedInMetamodel: aFMMetaModel ]
		ifFalse: [ oppositeType metamodel = aFMMetaModel ]

]

{ #category : #running }
FamixMetamodelChecks >> checkRelationsOf: aFMClass inMetamodel: aMetaModel [

	aFMClass allComplexProperties do: [ :fmRelation |
		fmRelation hasOpposite ifTrue: [
			(self checkOppositeOf: fmRelation existInMetamodel: aMetaModel)
				ifFalse: [ self fmClass: aFMClass missingOppositeFor: fmRelation] 
		]
	]
]

{ #category : #running }
FamixMetamodelChecks >> fmClass: aFMClass missingOppositeFor: aFMRelation [

	errors add: (FamixCheckMissingOpposite
		fmClass: aFMClass
		fmRelation: aFMRelation)
]

{ #category : #running }
FamixMetamodelChecks >> relationsOf: aFM3Class from: aPharoTrait [ 

	^aFM3Class allComplexProperties select: [ :relation |
		relation hasOpposite and: 
		[ relation compiledMethod methodClass = aPharoTrait ]
	]
]

{ #category : #running }
FamixMetamodelChecks >> trait: aPharoTrait usedInMetamodel: aMetaModel [

	^aMetaModel classes anySatisfy: [ :class |
		class traits anySatisfy: [ :trait |
			trait implementingClass = aPharoTrait
		]
	]

	
]
