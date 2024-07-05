Class {
	#name : #FamixTest8Generator,
	#superclass : #FamixBasicInfrastructureGenerator,
	#instVars : [
		'livingBeing',
		'animal',
		'plant',
		'bacteria',
		'virus',
		'biotope',
		'tResident',
		'tBiotope',
		'tInfectious',
		'tInfectable',
		'residence',
		'infection'
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

	residence := (self builder association: #Residence)
		             source: tResident;
		             target: tBiotope;
		             yourself.

	infection := (self builder association: #Infection)
		             source: tInfectious;
		             target: tInfectable;
		             yourself
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
	bacteria --|> livingBeing.

	"TResident -> Residence -> TBiotope"
	livingBeing --|> tResident.
	biotope --|> tBiotope.

	"TInfectious -> Infection -> TInfectable"
	animal --|> tInfectable.
	plant --|> tInfectable.

	bacteria --|> tInfectious.
	virus --|> tInfectious
]

{ #category : #definition }
FamixTest8Generator >> defineProperties [

	infection property: #isInvasive type: #Boolean defaultValue: false.

	tInfectious property: #pathogenicity type: #Number
]

{ #category : #definition }
FamixTest8Generator >> defineTraits [

	tResident := self builder newTraitNamed: #TResident.
	tBiotope := self builder newTraitNamed: #TBiotope.

	tInfectious := self builder newTraitNamed: #TInfectable.
	tInfectable := self builder newTraitNamed: #TInfectious
]
