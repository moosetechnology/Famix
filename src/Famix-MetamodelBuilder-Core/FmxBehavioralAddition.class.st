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
	#category : 'Famix-MetamodelBuilder-Core-Generation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Generation'
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
		             slots ifNotNil: [ builder slots: (self class compiler evaluate: '{' , (slots joinUsing: '. ') , '}') ] ].

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

{ #category : 'testing' }
FmxBehavioralAddition >> isRequired [

	^ self realClass
		  ifNil: [ true ]
		  ifNotNil: [ :realClass |
				  realClass localSlots ifEmpty: [ self slots ifNotNil: [ ^ true ] ] ifNotEmpty: [ :currentSlots |
						  self slots ifNil: [ ^ true ].
						  self slots size = currentSlots size ifFalse: [ ^ true ].
						  (self slots allSatisfy: [ :slotDefinition | currentSlots anySatisfy: [ :slot | slot definitionString = slotDefinition ] ]) ifFalse: [ ^ true ] ].

				  realClass traitComposition isEmpty
					  ifTrue: [ self traits ifNotNil: [ ^ true ] ]
					  ifFalse: [
							  self traits ifNil: [ ^ true ].
							  (OpalCompiler new
								   failBlock: [ ^ true ];
								   source: self traits;
								   evaluate) asTraitComposition = realClass traitComposition ifFalse: [ ^ true ] ].

				  realClass package name = self package ifFalse: [ ^ true ].
				  realClass packageTag name ~= self tag ]
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
FmxBehavioralAddition >> package [
	^ package
]

{ #category : 'accessing' }
FmxBehavioralAddition >> package: anObject [
	package := anObject
]

{ #category : 'printing' }
FmxBehavioralAddition >> printOn: aStream [

	super printOn: aStream.

	aStream
		nextPutAll: '[ name: ';
		nextPutAll: (name ifNil: [ 'unnumed' ]).
	slots ifNotNil: [
			aStream
				nextPutAll: ' slots: ';
				print: slots ].
	traits ifNotNil: [
			aStream
				nextPutAll: ' uses:  ';
				print: traits ].
	aStream
		nextPutAll: ' package: ';
		nextPutAll: package;
		nextPutAll: ' tag: ';
		nextPutAll: tag;
		nextPutAll: ']'
]

{ #category : 'accessing' }
FmxBehavioralAddition >> realClass [

	^ self class environment at: self name ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FmxBehavioralAddition >> slots [
	^ slots
]

{ #category : 'accessing' }
FmxBehavioralAddition >> slots: anObject [
	slots := anObject
]

{ #category : 'accessing' }
FmxBehavioralAddition >> tag [
	^ tag
]

{ #category : 'accessing' }
FmxBehavioralAddition >> tag: anObject [
	tag := anObject
]

{ #category : 'accessing' }
FmxBehavioralAddition >> traits [
	^ traits
]

{ #category : 'accessing' }
FmxBehavioralAddition >> traits: anObject [
	traits := anObject
]
