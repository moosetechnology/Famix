Class {
	#name : #FamixTest8Generator,
	#superclass : #FamixBasicInfrastructureGenerator,
	#instVars : [
		'livingBeing',
		'animal',
		'plant',
		'bacteria',
		'virus',
		'biotope'
	],
	#category : #'Famix-TestGenerators'
}

{ #category : #accessing }
FamixTest8Generator class >> packageName [

	^ #'Famix-Test8-Entities'
]

{ #category : #accessing }
FamixTest8Generator class >> prefix [

	^ #'FamixTest8'
]

{ #category : #accessing }
FamixTest8Generator class >> submetamodels [

	^ { FamixGenerator }
]

{ #category : #definition }
FamixTest8Generator >> defineAssociations [

	(self builder association: #Residence)
		source: #resident type: livingBeing;
		target: #biotope type: biotope.

	(self builder association: #Infection)
		source: #infectious type: {
				bacteria.
				virus };
		target: #infectable type: {
				animal.
				plant }
]

{ #category : #definition }
FamixTest8Generator >> defineClasses [

	livingBeing := self builder newClassNamed: #LivingBeing.
	animal := self builder newClassNamed: #Animal.
	plant := self builder newClassNamed: #Plant.
	bacteria := self builder newClassNamed: #Bacteria.
	virus := self builder newClassNamed: #Virus.
	biotope := self builder newClassNamed: #Biotope
]

{ #category : #definition }
FamixTest8Generator >> defineHierarchy [

	animal --|> livingBeing.
	plant --|> livingBeing.
	bacteria --|> livingBeing
]

{ #category : #definition }
FamixTest8Generator >> defineProperties [

	(self builder classNamed: #Residence)
		property: #isInvasive
		type: #Boolean
		defaultValue: false.

	(self builder traitNamed: #TInfectious)
		property: #pathogenicity
		type: #Number
]
