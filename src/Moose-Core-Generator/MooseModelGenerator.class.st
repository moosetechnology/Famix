Class {
	#name : 'MooseModelGenerator',
	#superclass : 'FamixMetamodelGenerator',
	#instVars : [
		'obj',
		'abstractGroup',
		'group',
		'specializedGroup',
		'model',
		'entity'
	],
	#category : 'Moose-Core-Generator',
	#package : 'Moose-Core-Generator'
}

{ #category : 'accessing' }
MooseModelGenerator class >> packageName [

	<ignoreForCoverage>
	^ #'Moose-Core'
]

{ #category : 'accessing' }
MooseModelGenerator class >> prefix [

	<ignoreForCoverage>
	^ #Moose
]

{ #category : 'definition' }
MooseModelGenerator >> defineClasses [

	super defineClasses.

	obj := builder newClassNamed: #Object.
	obj superclass: Object. "Cyril: I am REALLY not a fan of this. The superclass is always a FmxMBClass except for this one case... I hate that. It pushes us to have extensions of Object and some weird conditions in the code..."
	abstractGroup := builder newClassNamed: #AbstractGroup.
	group := builder newClassNamed: #Group.
	specializedGroup := builder newClassNamed: #SpecializedGroup.
	model := builder newClassNamed: #Model.
	entity := builder newClassNamed: #Entity
]

{ #category : 'definition' }
MooseModelGenerator >> defineHierarchy [

	super defineHierarchy.

	abstractGroup --|> obj.
	group --|> abstractGroup.
	specializedGroup --|> group.
	model --|> abstractGroup.
	entity --|> obj

	
]

{ #category : 'definition' }
MooseModelGenerator >> newBuilder [

	^ super newBuilder
		  withoutModel;
		  yourself
]
