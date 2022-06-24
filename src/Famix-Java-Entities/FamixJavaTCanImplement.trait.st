"
I can be the source of an implementation (cf a class implementing an Interface)
"
Trait {
	#name : #FamixJavaTCanImplement,
	#instVars : [
		'#interfaceImplementations => FMMany type: #FamixJavaImplementation opposite: #implementingClass'
	],
	#category : #'Famix-Java-Entities-Traits'
}

{ #category : #meta }
FamixJavaTCanImplement classSide >> annotation [

	<FMClass: #TCanImplement super: #Object>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #adding }
FamixJavaTCanImplement >> addInterfaceImplementation: anObject [
	<generated>
	^ self interfaceImplementations add: anObject
]

{ #category : #accessing }
FamixJavaTCanImplement >> interfaceImplementations [
	"Relation named: #interfaceImplementations type: #FamixJavaImplementation opposite: #implementingClass"

	<generated>
	<FMComment: 'Implementation relationships'>
	<derived>
	^ interfaceImplementations
]

{ #category : #accessing }
FamixJavaTCanImplement >> interfaceImplementations: anObject [

	<generated>
	interfaceImplementations value: anObject
]
