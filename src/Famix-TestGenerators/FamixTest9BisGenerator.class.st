Class {
	#name : #FamixTest9BisGenerator,
	#superclass : #FamixTest9Generator,
	#category : #'Famix-TestGenerators'
}

{ #category : #accessing }
FamixTest9BisGenerator class >> packageName [

	^ #'Famix-Test9-Entities'
]

{ #category : #accessing }
FamixTest9BisGenerator class >> prefix [

	^ #'FamixTest9'
]

{ #category : #definition }
FamixTest9BisGenerator >> defineRelations [

	"Here everything is the same except for the entities on the relation"
	subclass *- superclass
]
