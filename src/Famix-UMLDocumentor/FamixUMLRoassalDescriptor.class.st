"
Used by Roassal (`RSUMLClassBuilder`) to get informations about classes to put in the visualization

""Formating"" is in #initialize

The other methods or mainly helpers

API:
- aggregations -- returns all aggregations in the model
- compositions -- used to represent class-use-trait relationships
"
Class {
	#name : #FamixUMLRoassalDescriptor,
	#superclass : #RSUMLClassDescriptor,
	#instVars : [
		'umlModel'
	],
	#category : #'Famix-UMLDocumentor-Backend'
}

{ #category : #accessing }
FamixUMLRoassalDescriptor >> aggregations [

	^(umlModel
		select: [ :umlEntity |
			(umlEntity class = FamixUMLAssociation) and:
			[ umlEntity aggregation = #source ] ]
		thenCollect: [ :aggreg |
			(self umlClassNamed: aggreg target) -> (self umlClassNamed: aggreg source) ])
		,
		(umlModel
		select: [ :umlEntity |
			(umlEntity class = FamixUMLAssociation) and:
			[ umlEntity aggregation = #target ] ]
		thenCollect: [ :aggreg |
			(self umlClassNamed: aggreg source) -> (self umlClassNamed: aggreg target) ])
]

{ #category : #accessing }
FamixUMLRoassalDescriptor >> compositions [

	^(umlModel
		select: [ :umlEntity | umlEntity class = FamixUMLUse ]
		thenCollect: [ :use |
			(self umlClassNamed: use target) -> (self umlClassNamed: use source) ])

]

{ #category : #initialization }
FamixUMLRoassalDescriptor >> initialize [ 

	super initialize.

	self
		classname: #name ;
		superclass: [ :famixUMLClass | self superClassOf: famixUMLClass ] ;
		instVars: [ :famixUMLClass | famixUMLClass properties sorted: #name ascending ] ;
		methods: [ :famixUMLClass | #() ] ;
		instVarSelector: #name ;
		"methodSelector: #name ;"
		isAbstract: [ :famixUMLClass | famixUMLClass isStub ]
]

{ #category : #initialization }
FamixUMLRoassalDescriptor >> superClassOf: famixUMLClass [

	^umlModel
		detect: [ :entity |
			(entity class = FamixUMLInheritance) and: 
			[ entity source = famixUMLClass name ] ]
		ifOne: [ :famixUMLInheritance | self umlClassNamed: famixUMLInheritance target ]
		ifNone: [ nil ]
]

{ #category : #initialization }
FamixUMLRoassalDescriptor >> umlClassNamed: aName [

	^umlModel
		detect: [ :entity |
			(entity class = FamixUMLClass) and: 
			[ entity name = aName ] ]
		ifNone: [ nil ]
]

{ #category : #accessing }
FamixUMLRoassalDescriptor >> umlModel [

	^ umlModel
]

{ #category : #accessing }
FamixUMLRoassalDescriptor >> umlModel: anObject [

	umlModel := anObject
]
