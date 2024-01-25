"
Check if a metamodel class is properly declared using a <MSEClass:super:> pragma.
Additionally, this pragma should be in a #annotation class-side method, although this is not enforced. Default Moose tools are resilient with respect to metamodel descriptions, and accept as metamodel classes any subclass of MooseEntity. This rule enforces that all such classes are properly described in Fame, ensuring proper use by strict tools.
"
Class {
	#name : #FamixMetaModelClassesNotDeclaredInFameRule,
	#superclass : #RBBlockLintRule,
	#instVars : [
		'metaModelClasses'
	],
	#category : #'Moose-Core'
}

{ #category : #accessing }
FamixMetaModelClassesNotDeclaredInFameRule class >> uniqueIdentifierName [
	^ 'MetaModelClassesNotDeclaredInFame'
]

{ #category : #running }
FamixMetaModelClassesNotDeclaredInFameRule >> checkClass: aContext [
	| class pragmas |
	class := aContext.

	(self metaModelClasses includes: class instanceSide)
		ifTrue: [ pragmas := Pragma allNamed: #FMClass:super: in: class.
			pragmas
				ifEmpty: [ class isMeta ifTrue: [ result addClass: class ].
					^ self ].
			pragmas size > 1
				ifTrue: [ result addClass: class.
					^ self ] ]
]

{ #category : #accessing }
FamixMetaModelClassesNotDeclaredInFameRule >> group [

	^ 'Famix'
]

{ #category : #accessing }
FamixMetaModelClassesNotDeclaredInFameRule >> metaModelClasses [
	"return all classes that have to be checked in this rule"
	^ metaModelClasses ifNil: [metaModelClasses := MooseEntity withAllSubclasses].
]

{ #category : #accessing }
FamixMetaModelClassesNotDeclaredInFameRule >> name [

	^ 'A metamodel class is not properly Fame-described by a <FMClass:super:> pragma'
]

{ #category : #running }
FamixMetaModelClassesNotDeclaredInFameRule >> resultClass [

	^ RBClassEnvironment 
]
