Class {
	#name : 'FmxMBTraitTest',
	#superclass : 'FmxMBBehaviorTest',
	#category : 'Famix-MetamodelBuilder-Tests-Tests',
	#package : 'Famix-MetamodelBuilder-Tests',
	#tag : 'Tests'
}

{ #category : 'accessing' }
FmxMBTraitTest >> behaviorClass [

	^ FmxMBTrait
]

{ #category : 'accessing' }
FmxMBTraitTest >> newEntityNamed: aString [

	^ builder newTraitNamed: aString
]

{ #category : 'tests' }
FmxMBTraitTest >> testGenerateRemotesGeneratesRelations [
	| traitA traitB classA classB instanceOfA instanceOfB | 
	traitA := FmxTraitsTestGenerateAccessorBModel metamodel elementNamed: 'Famix-MetamodelBuilder-TestsTraitsResources-A.TraitA'.
	traitB := FmxTraitsTestGenerateAccessorBModel metamodel elementNamed: 'Famix-MetamodelBuilder-TestsTraitsResources-B.TraitB'.
	classA := FmxTraitsTestGenerateAccessorBModel metamodel elementNamed: 'Famix-MetamodelBuilder-TestsTraitsResources-B.ClassA'.
	classB := FmxTraitsTestGenerateAccessorBModel metamodel elementNamed: 'Famix-MetamodelBuilder-TestsTraitsResources-B.ClassB'.

	self assert: (traitA complexProperties anySatisfy: [:each| each opposite mmClass = traitB]).
	self assert: (traitB complexProperties anySatisfy: [:each| each opposite mmClass = traitA]).
	
	instanceOfA := classA implementingClass new.
	instanceOfB := classB implementingClass new.
	
	instanceOfA relationToB: instanceOfB.
	self assert: instanceOfA relationToB equals: instanceOfB.
	
	instanceOfB relationToA: instanceOfA.
	self assert: instanceOfB relationToA equals: instanceOfA.
]

{ #category : 'tests' }
FmxMBTraitTest >> testTestingMethods [

	"test messages isMetamodelClass and isMetamodelTrait"
	
	| tNamed |

	tNamed := builder newTraitNamed: #TNamedEntity.	

	self deny: tNamed isMetamodelClass.
	self assert: tNamed isMetamodelTrait.
	
	
]

{ #category : 'tests - names' }
FmxMBTraitTest >> testTraitGeneralization [

	| aTrait aClass |
		
	aTrait := builder newTraitNamed: #TVariable.	
	aClass := builder newClassNamed: #Variable.	
		
	self should: [aTrait --|> aClass] raise: Error
]

{ #category : 'tests' }
FmxMBTraitTest >> testTraitTestingSelectors [
	"test automatic generation of testing methods in the entities hierarchy"

	| simpleClass |
	simpleClass := builder newTraitNamed: #TComment.
	self assertEmpty: simpleClass testingSelectors.
	simpleClass withTesting.
	self assertCollection: simpleClass testingSelectors hasSameElements: #(isComment)
]
