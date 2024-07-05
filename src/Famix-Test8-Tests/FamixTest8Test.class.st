Class {
	#name : #FamixTest8Test,
	#superclass : #TestCase,
	#instVars : [
		'associationFM3Class'
	],
	#category : #'Famix-Test8-Tests'
}

{ #category : #running }
FamixTest8Test >> setUp [

	super setUp.

	associationFM3Class := FamixTest8Infection mooseDescription
]

{ #category : #tests }
FamixTest8Test >> testAssociationsAreClasses [

	self assert: associationFM3Class isFM3Class
]

{ #category : #tests }
FamixTest8Test >> testAssociationsHaveSourceAndTarget [

	self assert: (associationFM3Class allProperties anySatisfy: #isSource).

	self assert: (associationFM3Class allProperties anySatisfy: #isTarget)
]

{ #category : #tests }
FamixTest8Test >> testAssociationsProperties [

	self
		assert:
		(associationFM3Class allProperties detect: #isSource) opposite name
		equals: #outgoing , associationFM3Class name asEnglishPlural.

	self
		assert:
		(associationFM3Class allProperties detect: #isTarget) opposite name
		equals: #incoming , associationFM3Class name asEnglishPlural
]
