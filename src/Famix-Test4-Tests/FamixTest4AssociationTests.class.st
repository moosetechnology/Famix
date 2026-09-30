"
Checks that the association defined by FamixTest4Generator is generated as an FM3 class whose properties are marked as source and target, and whose opposite names follow the conventions of the metamodel builder.

Ported from FamixTest8Test when Famix-Test8-Entities was merged into Famix-Test4-Entities.
"
Class {
	#name : 'FamixTest4AssociationTests',
	#superclass : 'TestCase',
	#instVars : [
		'associationFM3Class'
	],
	#category : 'Famix-Test4-Tests',
	#package : 'Famix-Test4-Tests'
}

{ #category : 'running' }
FamixTest4AssociationTests >> setUp [

	super setUp.

	associationFM3Class := FamixTest4ClassSession metadescription
]

{ #category : 'tests' }
FamixTest4AssociationTests >> testAssociationsAreClasses [

	self assert: associationFM3Class isFM3Class
]

{ #category : 'tests' }
FamixTest4AssociationTests >> testAssociationsHaveSourceAndTarget [

	self assert: (associationFM3Class allProperties anySatisfy: #isSource).

	self assert: (associationFM3Class allProperties anySatisfy: #isTarget)
]

{ #category : 'tests' }
FamixTest4AssociationTests >> testAssociationsProperties [

	self assert: (associationFM3Class allProperties detect: #isSource) opposite name equals: #outgoing , associationFM3Class name asEnglishPlural.

	self assert: (associationFM3Class allProperties detect: #isTarget) opposite name equals: #incoming , associationFM3Class name asEnglishPlural
]
