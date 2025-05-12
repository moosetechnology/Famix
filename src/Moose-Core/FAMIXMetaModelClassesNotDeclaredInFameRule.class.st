"
Check if a metamodel class is properly declared using a <FMClass:super:> pragma.
Additionally, this pragma should be in a #annotation class-side method, although this is not enforced. Default Moose tools are resilient with respect to metamodel descriptions, and accept as metamodel classes any subclass of MooseEntity. This rule enforces that all such classes are properly described in Fame, ensuring proper use by strict tools.
"
Class {
	#name : #FamixMetaModelClassesNotDeclaredInFameRule,
	#superclass : #ReAbstractRule,
	#instVars : [
		'metaModelClasses'
	],
	#category : #'Moose-Core'
}

{ #category : #testing }
FamixMetaModelClassesNotDeclaredInFameRule class >> checksClass [

	^ true
]

{ #category : #accessing }
FamixMetaModelClassesNotDeclaredInFameRule class >> group [

	^ 'Famix'
]

{ #category : #accessing }
FamixMetaModelClassesNotDeclaredInFameRule class >> ruleName [

	^ 'A metamodel class is not properly Fame-described by a <FMClass:super:> pragma'
]

{ #category : #accessing }
FamixMetaModelClassesNotDeclaredInFameRule class >> uniqueIdentifierName [
	^ 'MetaModelClassesNotDeclaredInFame'
]

{ #category : #running }
FamixMetaModelClassesNotDeclaredInFameRule >> basicCheck: aClass [

	| pragmas |
	(self metaModelClasses includes: aClass instanceSide) ifTrue: [
		pragmas := Pragma allNamed: #FMClass:super: in: aClass.
		pragmas ifEmpty: [
			aClass isMeta ifTrue: [ ^ true ].
			^ false ].
		pragmas size > 1 ifTrue: [ ^ true ] ].

	^ false
]

{ #category : #accessing }
FamixMetaModelClassesNotDeclaredInFameRule >> metaModelClasses [
	"return all classes that have to be checked in this rule"
	^ metaModelClasses ifNil: [metaModelClasses := MooseEntity withAllSubclasses].
]
