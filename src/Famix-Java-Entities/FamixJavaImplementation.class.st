Class {
	#name : #FamixJavaImplementation,
	#superclass : #FamixJavaEntity,
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#instVars : [
		'#implementingClass => FMOne type: #FamixJavaTCanImplement opposite: #interfaceImplementations',
		'#interface => FMOne type: #FamixJavaTImplementable opposite: #implementations'
	],
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaImplementation class >> annotation [

	<FMClass: #Implementation super: #FamixJavaEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixJavaImplementation >> implementingClass [
	"Relation named: #implementingClass type: #FamixJavaTCanImplement opposite: #interfaceImplementations"

	<generated>
	<FMComment: 'Class linked to in this relationship. from-side of the association'>
	<source>
	^ implementingClass
]

{ #category : #accessing }
FamixJavaImplementation >> implementingClass: anObject [

	<generated>
	implementingClass := anObject
]

{ #category : #accessing }
FamixJavaImplementation >> interface [
	"Relation named: #interface type: #FamixJavaTImplementable opposite: #implementations"

	<generated>
	<FMComment: 'Interface linked to in this relationship. to-side of the association'>
	<target>
	^ interface
]

{ #category : #accessing }
FamixJavaImplementation >> interface: anObject [

	<generated>
	interface := anObject
]
