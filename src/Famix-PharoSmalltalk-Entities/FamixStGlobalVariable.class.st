Class {
	#name : #FamixStGlobalVariable,
	#superclass : #FamixStNamedEntity,
	#traits : 'FamixTGlobalVariable + FamixTInvocationsReceiver',
	#classTraits : 'FamixTGlobalVariable classTrait + FamixTInvocationsReceiver classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStGlobalVariable class >> annotation [

	<FMClass: #GlobalVariable super: #FamixStNamedEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]
