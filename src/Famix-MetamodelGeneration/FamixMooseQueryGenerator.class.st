Class {
	#name : #FamixMooseQueryGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'tAssociationMetaLevelDependency',
		'tEntityMetaLevelDependency',
		'tOODependencyQueries'
	],
	#category : #'Famix-MetamodelGeneration'
}

{ #category : #accessing }
FamixMooseQueryGenerator class >> packageName [

	^ #'Moose-Query'
]

{ #category : #accessing }
FamixMooseQueryGenerator class >> prefix [

	^ ''
]

{ #category : #definition }
FamixMooseQueryGenerator >> defineHierarchy [

	tOODependencyQueries --|> tEntityMetaLevelDependency.

]

{ #category : #definition }
FamixMooseQueryGenerator >> defineTraits [

	tAssociationMetaLevelDependency := builder newTraitNamed: #TAssociationMetaLevelDependency.
	tEntityMetaLevelDependency := builder newTraitNamed: #TEntityMetaLevelDependency.
	tOODependencyQueries := builder newTraitNamed: #TOODependencyQueries.

]
