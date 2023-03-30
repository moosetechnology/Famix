Class {
	#name : #FAMIXNamedEntityTest,
	#superclass : #FAMIXSourcedEntityTest,
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #helpers }
FAMIXNamedEntityTest >> actualClass [
	^ FAMIXNamedEntity
]

{ #category : #tests }
FAMIXNamedEntityTest >> testIsAbstract [
	| entity |
	entity := self actualClass new.
	entity isAbstract: true.
	self assert: entity isAbstract
]

{ #category : #tests }
FAMIXNamedEntityTest >> testIsFinal [
	| entity |
	entity :=self actualClass new.
	entity isFinal: true.
	self assert: entity isFinal
]

{ #category : #tests }
FAMIXNamedEntityTest >> testIsPackage [
	| entity |
	entity := self actualClass new.
	entity bePackageVisibility.
	self assert: entity isPackageVisibility
]

{ #category : #tests }
FAMIXNamedEntityTest >> testIsPrivate [
	| entity |
	entity := self actualClass new.
	entity bePrivate.
	self assert: entity isPrivate
]

{ #category : #tests }
FAMIXNamedEntityTest >> testIsProtected [

	| entity |
	entity := self actualClass new.
	entity beProtected.
	self assert: entity isProtected
]

{ #category : #tests }
FAMIXNamedEntityTest >> testIsPublic [
	| entity |
	entity := self actualClass new.
	entity bePublic.
	self assert: entity isPublic
]
