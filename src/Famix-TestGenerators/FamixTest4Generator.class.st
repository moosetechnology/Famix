Class {
	#name : 'FamixTest4Generator',
	#superclass : 'FamixBasicInfrastructureGenerator',
	#instVars : [
		'superclass',
		'subclass',
		'myClass'
	],
	#category : 'Famix-TestGenerators',
	#package : 'Famix-TestGenerators'
}

{ #category : 'accessing' }
FamixTest4Generator class >> packageName [

	^ #'Famix-Test4-Entities'
]

{ #category : 'accessing' }
FamixTest4Generator class >> prefix [

	^ #'FamixTest4'
]

{ #category : 'testing' }
FamixTest4Generator class >> shouldBeUpToDateInLatestMoose [

	"This generator is used dynamically by the tests"
	^ false
]

{ #category : 'definition' }
FamixTest4Generator >> defineClasses [

	superclass := self builder newClassNamed: #MySuperclass.
	subclass := self builder newClassNamed: #MySubclass.
	myClass := self builder newClassNamed: #MyClass
]

{ #category : 'definition' }
FamixTest4Generator >> defineHierarchy [

	subclass --|> superclass
]

{ #category : 'definition' }
FamixTest4Generator >> defineProperties [

	myClass property: #isTasty type: #Boolean
]

{ #category : 'definition' }
FamixTest4Generator >> defineRelations [

	subclass *- subclass
]
