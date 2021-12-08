Class {
	#name : #FamixStLocalVariable,
	#superclass : #FamixStNamedEntity,
	#traits : 'FamixTInvocationsReceiver + FamixTLocalVariable',
	#classTraits : 'FamixTInvocationsReceiver classTrait + FamixTLocalVariable classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStLocalVariable class >> annotation [

	<FMClass: #LocalVariable super: #FamixStNamedEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixStLocalVariable >> mooseNameOn: stream [ 
	| parent |
	parent := self parentBehaviouralEntity.
	parent ifNotNil: 
		[ parent mooseNameOn: stream.
		stream nextPut: $. ].
	self name ifNotNil: [stream nextPutAll: self name]
]
