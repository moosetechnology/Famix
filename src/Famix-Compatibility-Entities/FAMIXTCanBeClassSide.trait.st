Trait {
	#name : #FAMIXTCanBeClassSide,
	#instVars : [
		'#isClassSide => FMProperty'
	],
	#category : #'Famix-Compatibility-Entities-Traits'
}

{ #category : #meta }
FAMIXTCanBeClassSide classSide >> annotation [

	<FMClass: #TCanBeClassSide super: #Object>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #accessing }
FAMIXTCanBeClassSide >> isClassSide [

	<FMProperty: #isClassSide type: #Boolean>
	<generated>
	<FMComment: 'Entity can be declared class side i.e. static'>
	^ isClassSide
]

{ #category : #accessing }
FAMIXTCanBeClassSide >> isClassSide: anObject [
	<generated>
	isClassSide := anObject
]
