Class {
	#name : #FamixTest7Generator,
	#superclass : #FamixBasicInfrastructureGenerator,
	#instVars : [
		'classEntity',
		'method',
		'inheritance'
	],
	#category : #'Famix-TestGenerators'
}

{ #category : #accessing }
FamixTest7Generator class >> packageName [

	^ #'Famix-Test7-Entities'
]

{ #category : #accessing }
FamixTest7Generator class >> prefix [

	^ #'FamixTest7'
]

{ #category : #definition }
FamixTest7Generator >> defineClasses [

	super defineClasses.
	classEntity := builder newClassNamed: #Class.
	method := builder newClassNamed: #Method.
	inheritance := builder newClassNamed: #Inheritance.

]

{ #category : #definition }
FamixTest7Generator >> defineHierarchy [

	super defineHierarchy.
	
	classEntity --|> #TClass.
	
	method --|> #TMethod.
	
	inheritance --|> #TInheritance.
]
