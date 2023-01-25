"
I represent a header file. Typically a .h or .hpp
"
Trait {
	#name : #FamixTHeader,
	#instVars : [
		'#headerOwner => FMOne type: #FamixTWithHeaders opposite: #header'
	],
	#traits : 'FamixTFile',
	#classTraits : 'FamixTFile classTrait',
	#category : #'Famix-Traits-Header'
}

{ #category : #meta }
FamixTHeader classSide >> annotation [

	<FMClass: #THeader super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTHeader >> headerOwner [
	"Relation named: #headerOwner type: #FamixTWithHeaders opposite: #header"

	<generated>
	<container>
	^ headerOwner
]

{ #category : #accessing }
FamixTHeader >> headerOwner: anObject [

	<generated>
	headerOwner := anObject
]

{ #category : #navigation }
FamixTHeader >> headerOwnerGroup [
	<generated>
	<navigation: 'HeaderOwner'>
	^ MooseSpecializedGroup with: self headerOwner
]
