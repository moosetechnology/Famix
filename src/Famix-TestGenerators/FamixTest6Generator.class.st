Class {
	#name : #FamixTest6Generator,
	#superclass : #FamixBasicInfrastructureGenerator,
	#instVars : [
		'spam',
		'bacon',
		'tCooked'
	],
	#category : #'Famix-TestGenerators'
}

{ #category : #accessing }
FamixTest6Generator class >> packageName [

	^ #'Famix-Test6-Entities'
]

{ #category : #accessing }
FamixTest6Generator class >> prefix [

	^ #'FamixTest6'
]

{ #category : #definition }
FamixTest6Generator >> defineClasses [

	super defineClasses.
	spam := builder newClassNamed: #Spam.
	bacon := builder newClassNamed: #Bacon
]

{ #category : #definition }
FamixTest6Generator >> defineHierarchy [

	super defineHierarchy.

	spam --|> bacon.
	bacon --|> tCooked 
]

{ #category : #definition }
FamixTest6Generator >> defineProperties [

	super defineProperties.
	bacon property: #isFood type: #Boolean defaultValue: true.
	bacon property: #eggs type: #Number defaultValue: 12.
	spam property: #isSomething type: #Boolean defaultValue: false.
	
	tCooked property: #isCooked type: #Boolean defaultValue: true
]

{ #category : #definition }
FamixTest6Generator >> defineTraits [

	super defineTraits.
	tCooked := builder newTraitNamed: #TCooked
]
