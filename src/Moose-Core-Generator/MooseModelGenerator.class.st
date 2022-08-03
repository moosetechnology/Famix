Class {
	#name : #MooseModelGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'obj',
		'abstractGroup',
		'group',
		'specializedGroup',
		'model',
		'entity'
	],
	#category : #'Moose-Core-Generator'
}

{ #category : #accessing }
MooseModelGenerator class >> packageName [

	<ignoreForCoverage>
	^ #'Moose-Core'
]

{ #category : #accessing }
MooseModelGenerator class >> prefix [

	<ignoreForCoverage>
	^ #Moose
]

{ #category : #definition }
MooseModelGenerator >> defineClasses [

	super defineClasses.

	obj := builder newClassNamed: #Object.
	obj classGeneralization: Object.
	abstractGroup := builder newClassNamed: #AbstractGroup.
	group := builder newClassNamed: #Group.
	specializedGroup := builder newClassNamed: #SpecializedGroup.
	model := builder newClassNamed: #Model.
	entity := builder newClassNamed: #Entity
	
]

{ #category : #definition }
MooseModelGenerator >> defineHierarchy [

	super defineHierarchy.

	abstractGroup --|> obj.
	group --|> abstractGroup.
	specializedGroup --|> group.
	model --|> abstractGroup.
	entity --|> obj

	
]
