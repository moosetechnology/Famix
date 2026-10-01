"
Tests that FamixTest1Generator correctly applies the annotation type traits on the generated entities (ported from FamixTest5Test).
"
Class {
	#name : #FamixTest1AnnotationsTest,
	#superclass : #FamixAbstractExportTestCase,
	#category : #'Famix-Test1-Tests'
}

{ #category : #running }
FamixTest1AnnotationsTest >> setUp [

	super setUp.

	model := FamixTest1Model new
]

{ #category : #tests }
FamixTest1AnnotationsTest >> testApplyOnOppositeOn [

	| ctype ttype cwith twith |
	ctype := model metamodel elementNamed: 'Famix-Test1-Entities.AnnotationType2'.
	ttype := model metamodel elementNamed: 'Famix-Traits.TAnnotationType'.
	cwith := model metamodel elementNamed: 'Famix-Test1-Entities.WithAnnotationType2'.
	twith := model metamodel elementNamed: 'Famix-Traits.TWithAnnotationTypes'.

	self assert: (ctype traits includes: ttype).
	self assert: (cwith traits includes: twith)
]

{ #category : #tests }
FamixTest1AnnotationsTest >> testApplyOnOppositeTraitOn [

	| ctype ttype cwith twith |
	ctype := model metamodel elementNamed: 'Famix-Test1-Entities.AnnotationType1'.
	ttype := model metamodel elementNamed: 'Famix-Traits.TAnnotationType'.
	cwith := model metamodel elementNamed: 'Famix-Test1-Entities.WithAnnotationType1'.
	twith := model metamodel elementNamed: 'Famix-Traits.TWithAnnotationTypes'.

	self assert: (ctype traits includes: ttype).
	self assert: (cwith traits includes: twith)
]

{ #category : #tests }
FamixTest1AnnotationsTest >> testTestingMethodsAreRight [
	"Regression test: https://github.com/moosetechnology/Famix/issues/1090"

	self assert: FamixTest1AnnotationType1 new isQueryable
]
