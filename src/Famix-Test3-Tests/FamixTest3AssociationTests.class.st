"
Checks that the association defined by FamixTest3Generator is generated as an FM3 class whose properties are marked as source and target, and whose opposite names follow the conventions of the metamodel builder.

Ported from FamixTest8Test when Famix-Test8-Entities was merged into Famix-Test3-Entities.
"
Class {
	#name : 'FamixTest3AssociationTests',
	#superclass : 'TestCase',
	#instVars : [
		'associationFM3Class'
	],
	#category : 'Famix-Test3-Tests',
	#package : 'Famix-Test3-Tests'
}

{ #category : 'running' }
FamixTest3AssociationTests >> setUp [

	super setUp.

	associationFM3Class := FamixTest3ClassSession metadescription
]

{ #category : 'tests' }
FamixTest3AssociationTests >> testAssociationsAreClasses [

	self assert: associationFM3Class isFM3Class
]

{ #category : 'tests' }
FamixTest3AssociationTests >> testAssociationsHaveSourceAndTarget [

	self assert: (associationFM3Class allProperties anySatisfy: #isSource).

	self assert: (associationFM3Class allProperties anySatisfy: #isTarget)
]

{ #category : 'tests' }
FamixTest3AssociationTests >> testAssociationsProperties [

	self assert: (associationFM3Class allProperties detect: #isSource) opposite name equals: #outgoing , associationFM3Class name asEnglishPlural.

	self assert: (associationFM3Class allProperties detect: #isTarget) opposite name equals: #incoming , associationFM3Class name asEnglishPlural
]
