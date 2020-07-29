"
A Moose group is a concrete group of entites in Moose. 

It is able to use the caching mecanisme of its super class.

A MooseGroup can be specailized by sending the message #specialize. Once it is specialized, its kind will change depending of its content. Check the comment of MooseSpecializedGroup for more infos.
"
Class {
	#name : #MooseGroup,
	#superclass : #MooseAbstractGroup,
	#category : #'Moose-Core'
}

{ #category : #meta }
MooseGroup class >> annotation [
	<FMClass: #Group super: #MooseAbstractGroup>
	<package: #Moose>

]

{ #category : #'instance creation' }
MooseGroup class >> with: anEntity withDescription: aDescription [
	^ (self with: anEntity)
		description: aDescription;
		yourself
]

{ #category : #'instance creation' }
MooseGroup class >> withAll: entities withDescription: aDescription [
	^ (self withAll: entities)
		description: aDescription;
		yourself
]

{ #category : #'instance creation' }
MooseGroup class >> withDescription: aDescription [
	^ self new
		description: aDescription;
		yourself
]

{ #category : #'adding/removing' }
MooseGroup >> , aGroup [
	^ self copy
		addAll: aGroup;
		yourself
]

{ #category : #'adding/removing' }
MooseGroup >> addAll: collection [
	self entityStorage addAll: collection
]

{ #category : #private }
MooseGroup >> changeTypeTo: aSmalltalkClass [
	self class == aSmalltalkClass ifTrue: [ ^ self ].

	self become: (aSmalltalkClass withAll: self entities withDescription: self description)
]

{ #category : #enumerating }
MooseGroup >> collect: aBlock [
	^ self species withAll: (self entities collect: aBlock)
]

{ #category : #'public interface' }
MooseGroup >> copyFrom: startIndex to: endIndex [
	^ self species withAll: (self entities copyFrom: startIndex to: endIndex)
]

{ #category : #'public interface' }
MooseGroup >> distributionOverAGroupOfGroups: aGroupOfGroups [
	| distribution |
	distribution := 0.
	aGroupOfGroups
		do: [ :eachReferenceGroup | 
			| intersection |
			intersection := self intersection: eachReferenceGroup.
			distribution := distribution + (intersection size / eachReferenceGroup size) ].
	^ distribution
]

{ #category : #'public interface' }
MooseGroup >> encapsulationOfAGroupOfGroups: aGroupOfGroups [
	| encapsulation |
	self ifEmpty: [ ^ 0 ].
	encapsulation := 0.
	aGroupOfGroups
		do: [ :eachReferenceGroup | 
			| intersection |
			intersection := self intersection: eachReferenceGroup.
			encapsulation := intersection size / eachReferenceGroup size * (intersection size / self size) + encapsulation ].
	^ encapsulation
]

{ #category : #'public interface' }
MooseGroup >> indexOf: anEntity [
	^ self entities indexOf: anEntity
]

{ #category : #initialization }
MooseGroup >> initialize [
	super initialize.
	self description: 'Group'
]

{ #category : #'public interface' }
MooseGroup >> max: aSymbolOrBlock [
	^ self inject: (aSymbolOrBlock value: self first) into: [ :max :each | max max: (aSymbolOrBlock value: each) ]
]

{ #category : #'public interface' }
MooseGroup >> min: aSymbolOrBlock [
	^ self inject: (aSymbolOrBlock value: self first) into: [ :min :each | min min: (aSymbolOrBlock value: each) ]
]

{ #category : #accessing }
MooseGroup >> mooseDescription [
	^ self mooseModel
		ifNil: [ FM3NullClass new ]
		ifNotNil: [ :model | model mooseDescriptionFor: self class ]
]

{ #category : #accessing }
MooseGroup >> name [
	^ self attributeAt: #privateDescription ifAbsent: [ #group ]
]

{ #category : #'public interface' }
MooseGroup >> noneSatisfy: aBlock [
	^ self entities noneSatisfy: aBlock
]

{ #category : #printing }
MooseGroup >> printOn: aStream [
	aStream
		nextPutAll: self description;
		space;
		nextPut: $(;
		print: self size;
		space.
	self ifEmpty: [ aStream nextPutAll: 'entities' ].
	self size = 1 ifTrue: [ aStream nextPutAll: self anyOne class name ].
	self size > 1 ifTrue: [ aStream nextPutAll: storage commonSuperclass name asEnglishPlural ].
	aStream nextPut: $)
]

{ #category : #enumerating }
MooseGroup >> reject: aBlock [
	^ self species withAll: (self entities reject: aBlock)
]

{ #category : #'adding/removing' }
MooseGroup >> remove: anItem [
	self removeEntity: anItem
]

{ #category : #'adding/removing' }
MooseGroup >> removeAll: collection [
	collection do: [ :each | self removeEntity: each ]
]

{ #category : #enumerating }
MooseGroup >> select: aBlock [
	^ self species withAll: (self entities select: aBlock)
]

{ #category : #'public interface' }
MooseGroup >> sort: aBlock [
	self entities: (self entities sorted: aBlock)
]

{ #category : #'public interface' }
MooseGroup >> sorted: aBlock [
	^ self species withAll: (self entities sorted: aBlock)
]

{ #category : #'public interface' }
MooseGroup >> specialize [
	"Once call, tranforme the MooseGroup into a MooseSpecializedGroup. This group will try to adapt its kind to its content to give more properties to the users to manipulate."

	^ MooseSpecializedGroup withAll: self entities withDescription: self description
]

{ #category : #private }
MooseGroup >> species [
	^ MooseGroup
]

{ #category : #properties }
MooseGroup >> sumOfPropertyNamed: aPropertyName [
	^ self inject: 0 into: [ :sum :each | sum + (each propertyNamed: aPropertyName ifNil: [ 0 ]) ]
]
