Class {
	#name : #CppBlock,
	#superclass : #CppBehaviouralEntity,
	#instVars : [
		'#parentBlock => FMOne type: #CppBehaviouralEntity opposite: #innerBlocks'
	],
	#category : #'Cpp-Entities-Entities'
}

{ #category : #meta }
CppBlock class >> annotation [

	<FMClass: #Block super: #CppBehaviouralEntity>
	<package: #'Cpp-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
CppBlock >> accesses [
	accesses ifNil: [ self localizeDefsAndRefs ].
	^ super accesses
]

{ #category : #accessing }
CppBlock >> accesses: aCollection [
	"re-implementing o that it does not set the reverse link from elements in aCollection to self"
	accesses := aCollection 
]

{ #category : #accessing }
CppBlock >> attributes [
	^ self accesses collectAsSet: #variable
]

{ #category : #accessing }
CppBlock >> belongsTo [
	^ self parentBlock
]

{ #category : #accessing }
CppBlock >> blocks [
	^ self innerBlocks
]

{ #category : #accessing }
CppBlock >> endLine [
	^ self sourceAnchor endLine

]

{ #category : #initialization }
CppBlock >> getMyLocalsFrom: aCollection [
	"from aCollection of entities (or associations) with FileAnchors,
	 return those that are in the scope of receiver"

	^ aCollection select: [ :each | each sourceAnchor isNotNil and: [ each sourceAnchor isWithin: self sourceAnchor ] ]

]

{ #category : #testing }
CppBlock >> hasPriorityOn: anEntity [
	^ anEntity isCPPSBlock
		ifTrue: [ self start < anEntity start ]
		ifFalse: [ (anEntity hasPriorityOn: self) not ]

]

{ #category : #testing }
CppBlock >> isCPPSBlock [

	<generated>
	^ true
]

{ #category : #initialization }
CppBlock >> localizeDefsAndRefs [
	(parentBlock isNotNil and: [ sourceAnchor isNotNil ]) ifFalse: [ ^ self ].
	self outgoingInvocations: (self getMyLocalsFrom: parentBlock outgoingInvocations).
	self accesses: (self getMyLocalsFrom: parentBlock accesses)
]

{ #category : #accessing }
CppBlock >> mooseModel [
	^ self attributeAt: #mooseModel ifAbsent: [ parentBlock mooseModel ifNil: [ super mooseModel ] ]

]

{ #category : #accessing }
CppBlock >> name [
	^ String streamContents: [ :s | self printOn: s ]

]

{ #category : #accessing }
CppBlock >> outgoingInvocations: aCollection [
	"re-implementing so that it does not set the reverse link from elements in aCollection to self"
	outgoingInvocations := aCollection 

]

{ #category : #accessing }
CppBlock >> parentBehavioural: anObject [
	parentBlock := anObject.
	self localizeDefsAndRefs
]

{ #category : #accessing }
CppBlock >> parentBlock [
	"Relation named: #parentBlock type: #CppBehaviouralEntity opposite: #innerBlocks"

	<generated>
	<FMComment: '"Block" containing this block. belongsTo implementation'>
	^ parentBlock
]

{ #category : #accessing }
CppBlock >> parentBlock: anObject [

	<generated>
	parentBlock := anObject
]

{ #category : #printing }
CppBlock >> printOn: aStream [
	
	aStream
		nextPutAll: self class name;
		nextPut: $(;
		print: (sourceAnchor 
			ifNil: [ 'nil' ]
			ifNotNil: [ sourceAnchor startPos ]);
		nextPutAll: '@';
		print: (sourceAnchor 
			ifNil: [ 'nil' ]
			ifNotNil: [ sourceAnchor endPos ]);
		nextPut: $)

]

{ #category : #accessing }
CppBlock >> sourceAnchor: aSourceAnchor [
	super sourceAnchor: aSourceAnchor.
	self localizeDefsAndRefs 

]

{ #category : #accessing }
CppBlock >> start [
	^ self sourceAnchor startPos

]

{ #category : #accessing }
CppBlock >> startLine [
	^ self sourceAnchor startLine

]

{ #category : #accessing }
CppBlock >> stop [
	^ self sourceAnchor endPos

]
