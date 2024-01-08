Class {
	#name : #FamixUMLRoassalDescriptor,
	#superclass : #AnObsoleteRSUMLClassDescriptor,
	#instVars : [
		'umlModel'
	],
	#category : #'Famix-UMLDocumentor-Backend'
}

{ #category : #initialization }
FamixUMLRoassalDescriptor >> initialize [ 

	super initialize.


	self
		classname: #name;
		superclass: [ :famixUMLClass | self superClassOf: famixUMLClass ];
		instVars: [ :famixUMLClass | famixUMLClass properties ] ;
		methods: [ :famixUMLClass | #() ];
		methodSelector: #name;
		instVarSelector: #name;
		methodsLimit: SmallInteger maxVal;
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
