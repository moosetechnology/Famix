"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isClassSide` | `Boolean` | false | Entity can be declared class side i.e. static|

"
Trait {
	#name : #FamixTCanBeClassSide,
	#instVars : [
		'#isClassSide => FMProperty defaultValue: false'
	],
	#category : #'Famix-Traits-PrimitiveProperties'
}

{ #category : #meta }
FamixTCanBeClassSide classSide >> annotation [

	<FMClass: #TCanBeClassSide super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #visitor }
FamixTCanBeClassSide >> accept: aVisitor [

	<generated>
	^ aVisitor visitFamixTCanBeClassSide: self
]

{ #category : #accessing }
FamixTCanBeClassSide >> isClassSide [

	<FMProperty: #isClassSide type: #Boolean defaultValue: false>
	<generated>
	<FMComment: 'Entity can be declared class side i.e. static'>
	^ isClassSide ifNil: [ isClassSide := false ]
]

{ #category : #accessing }
FamixTCanBeClassSide >> isClassSide: anObject [
	<generated>
	isClassSide := anObject
]
