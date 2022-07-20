Class {
	#name : #FamixMetaModelClassesShouldNotOverrideRule,
	#superclass : #RBBlockLintRule,
	#instVars : [
		'metaModelClasses'
	],
	#category : #'Moose-Core'
}

{ #category : #accessing }
FamixMetaModelClassesShouldNotOverrideRule class >> uniqueIdentifierName [
	^ 'MetaModelClassShouldNotOverride'
]

{ #category : #running }
FamixMetaModelClassesShouldNotOverrideRule >> checkClass: aContext [
	|class  |
	class := aContext.
	
	(self metaModelClasses includes: class) 
		ifTrue: [
			self selectorsThatShouldNotBeOverriden do: [:each |
				(class includesSelector: each)
					ifTrue: [
						result addClass: class  selector: each
						].
			].
		].
]

{ #category : #accessing }
FamixMetaModelClassesShouldNotOverrideRule >> group [

	^ 'Famix'
]

{ #category : #accessing }
FamixMetaModelClassesShouldNotOverrideRule >> metaModelClasses [
	"return all classes that have to be checked in this rule"
	^ metaModelClasses ifNil: [metaModelClasses := MooseEntity allSubclasses].
]

{ #category : #accessing }
FamixMetaModelClassesShouldNotOverrideRule >> name [

	^ 'A metamodel class override a method that it should not override'
]

{ #category : #accessing }
FamixMetaModelClassesShouldNotOverrideRule >> rationale [

	^ 'check if a metamodel class (MooseEntity and all its subclasses) override some methods that it should not override. Those methods are specified by FamixMetaModelClassesShouldNotOverrideRule >> selectorsThatShouldNotBeOverriden'
]

{ #category : #accessing }
FamixMetaModelClassesShouldNotOverrideRule >> selectorsThatShouldNotBeOverriden [

	^ #(#mooseName #printString)
]
