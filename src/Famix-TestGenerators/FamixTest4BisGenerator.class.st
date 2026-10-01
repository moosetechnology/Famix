Class {
	#name : #FamixTest4BisGenerator,
	#superclass : #FamixTest4Generator,
	#category : #'Famix-TestGenerators'
}

{ #category : #accessing }
FamixTest4BisGenerator class >> packageName [

	^ #'Famix-Test4-Entities'
]

{ #category : #accessing }
FamixTest4BisGenerator class >> prefix [

	^ #'FamixTest4'
]

{ #category : #testing }
FamixTest4BisGenerator class >> shouldBeUpToDateInLatestMoose [

	"This generator is used dynamically by the tests"
	^ false
]

{ #category : #definition }
FamixTest4BisGenerator >> defineProperties [
	"Here everything is the same except for the default value of the property"

	myClass property: #isTasty type: #Boolean defaultValue: true
]

{ #category : #definition }
FamixTest4BisGenerator >> defineRelations [

	"Here everything is the same except for the entities on the relation"
	subclass *- superclass
]
