Trait {
	#name : #FamixTImplementation,
	#instVars : [
		'#implementingClass => FMOne type: #FamixTCanImplement opposite: #interfaceImplementations',
		'#interface => FMOne type: #FamixTImplementable opposite: #implementations'
	],
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTImplementation classSide >> annotation [

	<FMClass: #TImplementation super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixTImplementation >> implementingClass [
	"Relation named: #implementingClass type: #FamixTCanImplement opposite: #interfaceImplementations"

	<generated>
	<FMComment: 'Class linked to in this relationship. from-side of the association'>
	<source>
	^ implementingClass
]

{ #category : #accessing }
FamixTImplementation >> implementingClass: anObject [

	<generated>
	implementingClass := anObject
]

{ #category : #accessing }
FamixTImplementation >> interface [
	"Relation named: #interface type: #FamixTImplementable opposite: #implementations"

	<generated>
	<FMComment: 'Interface linked to in this relationship. to-side of the association'>
	<target>
	^ interface
]

{ #category : #accessing }
FamixTImplementation >> interface: anObject [

	<generated>
	interface := anObject
]
