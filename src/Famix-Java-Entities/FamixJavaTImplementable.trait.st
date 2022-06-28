"
I can be the target of an implementation cf Interface 
"
Trait {
	#name : #FamixJavaTImplementable,
	#instVars : [
		'#implementations => FMMany type: #FamixJavaImplementation opposite: #interface'
	],
	#category : #'Famix-Java-Entities-Traits'
}

{ #category : #meta }
FamixJavaTImplementable classSide >> annotation [

	<FMClass: #TImplementable super: #Object>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #adding }
FamixJavaTImplementable >> addImplementation: anObject [
	<generated>
	^ self implementations add: anObject
]

{ #category : #accessing }
FamixJavaTImplementable >> implementations [
	"Relation named: #implementations type: #FamixJavaImplementation opposite: #interface"

	<generated>
	<FMComment: 'Implementation relationships.'>
	<derived>
	^ implementations
]

{ #category : #accessing }
FamixJavaTImplementable >> implementations: anObject [

	<generated>
	implementations value: anObject
]
