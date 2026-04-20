Class {
	#name : 'FmxBehavioralAddition',
	#superclass : 'FmxCodeChange',
	#instVars : [
		'name',
		'traits',
		'slots',
		'package',
		'tag'
	],
	#category : 'Famix-MetamodelBuilder-Core-Changes',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Changes'
}

{ #category : 'accessing' }
FmxBehavioralAddition >> apply [

	| makeBlock |
	makeBlock := [ :builder |
		             self initialize: builder.
		             builder
			             name: name;
			             package: package;
			             tag: tag.

		             traits ifNotNil: [ builder traits: (self class compiler evaluate: traits) ].
		             slots ifNotNil: [ builder slots: (self class compiler evaluate: slots) ] ].

	"If the class already exist we update it to not remove the class slots and shared variables."
	self class environment
		at: name
		ifPresent: [ :class | self class classInstaller update: class to: makeBlock ]
		ifAbsent: [ self class classInstaller make: makeBlock ]
]

{ #category : 'initialization' }
FmxBehavioralAddition >> initialize: aBuilder [

	self subclassResponsibility
]

{ #category : 'accessing' }
FmxBehavioralAddition >> name [
	^ name
]

{ #category : 'accessing' }
FmxBehavioralAddition >> name: anObject [
	name := anObject
]

{ #category : 'accessing' }
FmxBehavioralAddition >> package: anObject [
	package := anObject
]

{ #category : 'printing' }
FmxBehavioralAddition >> printOn: aStream [

	super printOn: aStream.

	aStream
		nextPutAll: '[';
		nextPutAll: (name ifNil: [ 'unnumed' ]);
		nextPutAll: ']'
]

{ #category : 'accessing' }
FmxBehavioralAddition >> slots: anObject [
	slots := anObject
]

{ #category : 'accessing' }
FmxBehavioralAddition >> tag: anObject [
	tag := anObject
]

{ #category : 'accessing' }
FmxBehavioralAddition >> traits: anObject [
	traits := anObject
]
