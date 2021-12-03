Trait {
	#name : #FamixTest6TCooked,
	#instVars : [
		'#isCooked => FMProperty defaultValue: true'
	],
	#category : #'Famix-Test6-Entities-Traits'
}

{ #category : #meta }
FamixTest6TCooked classSide >> annotation [

	<FMClass: #TCooked super: #Object>
	<package: #'Famix-Test6-Entities'>
	<generated>
	^self
]

{ #category : #initialization }
FamixTest6TCooked >> initialize [

	<generated>
	super initialize.

	"Default value initialization"
	isCooked := true.

]

{ #category : #accessing }
FamixTest6TCooked >> isCooked [

	<FMProperty: #isCooked type: #Boolean defaultValue: true>
	<generated>
	^ isCooked
]

{ #category : #accessing }
FamixTest6TCooked >> isCooked: anObject [
	<generated>
	isCooked := anObject
]
