"
MooseSpecializedGroup adds on top of a group the ability to change the type of a group when we change the entities inside. This is determined via class names.

For example, a XYZGroup handles a group of XYZ entities. Thus, ""MooseSpecializedGroup with: XYZ new"" will return a XYZGroup. The type changing behavior also works at runtime. Thus, ""MooseSpecializedGroup new add: XYZ"" will also return a XYZGroup.

The goal of this abstraction is to provide a home for behavior that is specific to groups of entities. For example, a visualization that makes sense for a group of XYZ entities will become a method in the XYZGroup class.
"
Class {
	#name : #MooseSpecializedGroup,
	#superclass : #MooseGroup,
	#category : #'Moose-Core'
}

{ #category : #meta }
MooseSpecializedGroup class >> annotation [
	<FMClass: #SpecializedGroup super: #MooseGroup>
	<package: #Moose>

]

{ #category : #'instance creation' }
MooseSpecializedGroup class >> withAll: collection [

	^ (self = MooseSpecializedGroup
		ifTrue: [ collection commonSuperclass relatedGroupType ]
		ifFalse: [ self ]) new
		initializeWithAll: collection;
		yourself
]

{ #category : #'adding/removing' }
MooseSpecializedGroup >> add: anElement [
	super add: anElement.
	self updateTypeAccordingToEntities.
	^ anElement
]

{ #category : #'adding/removing' }
MooseSpecializedGroup >> addAll: aCollection [
	super addAll: aCollection.
	self updateTypeAccordingToEntities
]

{ #category : #converting }
MooseSpecializedGroup >> asMooseSpecializedGroup [

	^ self
]

{ #category : #private }
MooseSpecializedGroup >> changeTypeToDefaultType [
	self changeTypeTo: MooseSpecializedGroup
]

{ #category : #private }
MooseSpecializedGroup >> commonEntitiesClass [
	^ self entityStorage commonSuperclass
]

{ #category : #initialization }
MooseSpecializedGroup >> initializeWithAll: aCollection [
	super addAll: aCollection
]

{ #category : #'adding/removing' }
MooseSpecializedGroup >> remove: anEntity [
	super remove: anEntity.
	self updateTypeAccordingToEntities
]

{ #category : #'adding/removing' }
MooseSpecializedGroup >> removeAll: aCollection [
	super removeAll: aCollection.
	self updateTypeAccordingToEntities
]

{ #category : #private }
MooseSpecializedGroup >> species [
	^ MooseSpecializedGroup
]

{ #category : #private }
MooseSpecializedGroup >> updateTypeAccordingToEntities [

	| common wantedType class |
	common := self commonEntitiesClass.
	wantedType := common relatedGroupType.
	self name = wantedType ifTrue: [ ^ self ].
	class := MooseAbstractGroup allSubclasses
		         detect: [ :each | each name == wantedType name ]
		         ifNone: [ ^ self changeTypeToDefaultType ].
	self changeTypeTo: class
]
