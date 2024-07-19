Class {
	#name : #FamixTest10Generator,
	#superclass : #FamixBasicInfrastructureGenerator,
	#instVars : [
		'myClass'
	],
	#category : #'Famix-TestGenerators'
}

{ #category : #accessing }
FamixTest10Generator class >> packageName [

	^ #'Famix-Test10-Entities'
]

{ #category : #accessing }
FamixTest10Generator class >> prefix [

	^ #'FamixTest10'
]

{ #category : #testing }
FamixTest10Generator class >> shouldBeUpToDateInLatestMoose [

	"This generator is used dynamically by the tests"
	^ false
]

{ #category : #definition }
FamixTest10Generator >> defineClasses [

	myClass := self builder newClassNamed: #MyClass
]

{ #category : #definition }
FamixTest10Generator >> defineHierarchy [

	"Do nothing"
]

{ #category : #definition }
FamixTest10Generator >> defineRelations [

	myClass property: #isTasty type: #Boolean
]
