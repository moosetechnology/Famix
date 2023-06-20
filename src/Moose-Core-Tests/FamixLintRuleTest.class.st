Class {
	#name : #FamixLintRuleTest,
	#superclass : #TestCase,
	#category : #'Moose-Core-Tests'
}

{ #category : #tests }
FamixLintRuleTest >> testRules [
	{FamixMetaModelClassesNotDeclaredInFameRule . FamixMetaModelClassesShouldNotOverrideRule} do: [ :rule | RBSmalllintChecker runRule: rule new ]
]
