Class {
	#name : #FamixTest6Spam,
	#superclass : #FamixTest6Bacon,
	#instVars : [
		'#brand => FMProperty',
		'#isSomething => FMProperty defaultValue: false'
	],
	#category : #'Famix-Test6-Entities-Entities'
}

{ #category : #meta }
FamixTest6Spam class >> annotation [

	<FMClass: #Spam super: #FamixTest6Bacon>
	<package: #'Famix-Test6-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixTest6Spam >> brand [

	<FMProperty: #brand type: #FamixTest6Brand>
	<withDefaultValueFromType>
	<generated>
	^ brand ifNil: [ brand := FamixTest6Brand new ]
]

{ #category : #accessing }
FamixTest6Spam >> brand: anObject [
	<generated>
	brand := anObject
]

{ #category : #accessing }
FamixTest6Spam >> isSomething [

	<FMProperty: #isSomething type: #Boolean defaultValue: false>
	<generated>
	^ isSomething ifNil: [ isSomething := false ]
]

{ #category : #accessing }
FamixTest6Spam >> isSomething: anObject [
	<generated>
	isSomething := anObject
]
