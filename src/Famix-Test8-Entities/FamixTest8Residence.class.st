Class {
	#name : #FamixTest8Residence,
	#superclass : #FamixTest8Entity,
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#instVars : [
		'#resident => FMOne type: #FamixTest8TResident opposite: #outgoingResidences',
		'#biotope => FMOne type: #FamixTest8TBiotope opposite: #incomingResidences'
	],
	#category : #'Famix-Test8-Entities-Entities'
}

{ #category : #meta }
FamixTest8Residence class >> annotation [

	<FMClass: #Residence super: #FamixTest8Entity>
	<package: #'Famix-Test8-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixTest8Residence >> biotope [
	"Relation named: #biotope type: #FamixTest8TBiotope opposite: #incomingResidences"

	<generated>
	<target>
	^ biotope
]

{ #category : #accessing }
FamixTest8Residence >> biotope: anObject [

	<generated>
	biotope := anObject
]

{ #category : #accessing }
FamixTest8Residence >> resident [
	"Relation named: #resident type: #FamixTest8TResident opposite: #outgoingResidences"

	<generated>
	<source>
	^ resident
]

{ #category : #accessing }
FamixTest8Residence >> resident: anObject [

	<generated>
	resident := anObject
]
