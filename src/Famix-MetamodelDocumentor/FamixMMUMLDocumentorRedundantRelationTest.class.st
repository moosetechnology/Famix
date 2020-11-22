Class {
	#name : #FamixMMUMLDocumentorRedundantRelationTest,
	#superclass : #FamixMMUMLDocumentorAbstractTest,
	#category : #'Famix-MetamodelDocumentor-tests'
}

{ #category : #tests }
FamixMMUMLDocumentorRedundantRelationTest >> testContainerIsNotRedundantRelation [

	self deny: (documentor isRedundantRelation: (self famixProperty: 'school' in: FamixTest4Room))
]

{ #category : #tests }
FamixMMUMLDocumentorRedundantRelationTest >> testDerivedIsRedundantRelation [

	self assert: (documentor isRedundantRelation: (self famixProperty: 'students' in: FamixTest4School))
]

{ #category : #tests }
FamixMMUMLDocumentorRedundantRelationTest >> testWithoutOppositeIsNotRedundantRelation [
	"technically, this is not a relation, but it does not have opposite"
	self deny: (documentor isRedundantRelation: (self famixProperty: 'name' in: FamixTest4Entity))
]
