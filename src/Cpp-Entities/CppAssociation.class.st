Class {
	#name : #CppAssociation,
	#superclass : #CppSourcedEntity,
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#category : #'Cpp-Entities-Entities'
}

{ #category : #meta }
CppAssociation class >> annotation [

	<FMClass: #Association super: #CppSourcedEntity>
	<package: #'Cpp-Entities'>
	<generated>
	^self
]

{ #category : #printing }
CppAssociation >> displayStringOn: aStream [
	self flag: 'TODO'.
	aStream nextPutAll: ' TODO -> TODO'
	"self source displayStringOn: aStream.
	aStream nextPutAll: ' -> '.
	self target displayStringOn: aStream"
]

{ #category : #accessing }
CppAssociation >> start [
	^ self sourceAnchor
		ifNotNil: #startPos
		ifNil: [ MooseUnavailableMetric ]
]

{ #category : #accessing }
CppAssociation >> stop [
	^ self sourceAnchor
		ifNotNil: #endPos
		ifNil: [ MooseUnavailableMetric ]
]
