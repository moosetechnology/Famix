Class {
	#name : #FamixTest9Generator,
	#superclass : #FamixBasicInfrastructureGenerator,
	#instVars : [
		'superclass',
		'subclass'
	],
	#category : #'Famix-TestGenerators'
}

{ #category : #accessing }
FamixTest9Generator class >> packageName [

	^ #'Famix-Test9-Entities'
]

{ #category : #accessing }
FamixTest9Generator class >> prefix [

	^ #'FamixTest9'
]

{ #category : #definition }
FamixTest9Generator >> defineClasses [

	superclass := self builder newClassNamed: #MySuperclass.
	subclass := self builder newClassNamed: #MySubclass
]

{ #category : #definition }
FamixTest9Generator >> defineHierarchy [

	subclass --|> superclass
]

{ #category : #definition }
FamixTest9Generator >> defineRelations [

	subclass *- subclass
]
