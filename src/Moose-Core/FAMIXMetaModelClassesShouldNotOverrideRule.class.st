Class {
	#name : #FamixMetaModelClassesShouldNotOverrideRule,
	#superclass : #ReAbstractRule,
	#instVars : [
		'metaModelClasses'
	],
	#category : #'Moose-Core'
}

{ #category : #testing }
FamixMetaModelClassesShouldNotOverrideRule class >> checksClass [

	^ true
]

{ #category : #accessing }
FamixMetaModelClassesShouldNotOverrideRule class >> group [

	^ 'Famix'
]

{ #category : #accessing }
FamixMetaModelClassesShouldNotOverrideRule class >> rationale [

	^ 'check if a metamodel class (MooseEntity and all its subclasses) override some methods that it should not override. Those methods are specified by FamixMetaModelClassesShouldNotOverrideRule >> selectorsThatShouldNotBeOverridden'
]

{ #category : #accessing }
FamixMetaModelClassesShouldNotOverrideRule class >> ruleName [

	^ 'A metamodel class override a method that it should not override'
]

{ #category : #accessing }
FamixMetaModelClassesShouldNotOverrideRule class >> uniqueIdentifierName [
	^ 'MetaModelClassShouldNotOverride'
]

{ #category : #running }
FamixMetaModelClassesShouldNotOverrideRule >> basicCheck: aClass [

	(self metaModelClasses includes: aClass) ifTrue: [ self selectorsThatShouldNotBeOverridden do: [ :each | (aClass includesSelector: each) ifTrue: [ ^ true ] ] ].
	^ false
]

{ #category : #accessing }
FamixMetaModelClassesShouldNotOverrideRule >> metaModelClasses [
	"return all classes that have to be checked in this rule"
	^ metaModelClasses ifNil: [metaModelClasses := MooseEntity allSubclasses].
]

{ #category : #accessing }
FamixMetaModelClassesShouldNotOverrideRule >> selectorsThatShouldNotBeOverridden [

	^ #(#mooseName #printString)
]
