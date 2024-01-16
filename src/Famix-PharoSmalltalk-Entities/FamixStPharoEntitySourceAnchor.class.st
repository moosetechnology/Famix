"
## Relations
======================

### Other
- Relation: #element Type: #FamixTSourceEntity Opposite: #sourceAnchor Comment: Enable the accessibility to the famix entity that this class is a source pointer for


"
Class {
	#name : #FamixStPharoEntitySourceAnchor,
	#superclass : #FamixStSourceAnchor,
	#traits : 'FamixTSourceAnchor',
	#classTraits : 'FamixTSourceAnchor classTrait',
	#instVars : [
		'#pharoEntity => WeakSlot'
	],
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStPharoEntitySourceAnchor class >> annotation [

	<FMClass: #PharoEntitySourceAnchor super: #FamixStSourceAnchor>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^ self
]

{ #category : #initialization }
FamixStPharoEntitySourceAnchor >> initialize [
	super initialize.
]

{ #category : #accessing }
FamixStPharoEntitySourceAnchor >> pharoEntity [
	^ pharoEntity
]

{ #category : #accessing }
FamixStPharoEntitySourceAnchor >> pharoEntity: anObject [
	pharoEntity := anObject
]

{ #category : #accessing }
FamixStPharoEntitySourceAnchor >> sourceText [

	^ self pharoEntity ifNotNil: #definitionString
]
