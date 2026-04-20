Class {
	#name : 'FmxMBRingEnvironment',
	#superclass : 'Object',
	#instVars : [
		'ringEnvironment',
		'builder'
	],
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

{ #category : 'instance creation' }
FmxMBRingEnvironment class >> for: aBuilder [

	^ self new 
		builder: aBuilder;
		yourself.
]

{ #category : 'accessing' }
FmxMBRingEnvironment >> apply [

	"do nothing"
]

{ #category : 'accessing' }
FmxMBRingEnvironment >> basicGroupSuperclass [

	^ self ringEnvironment ensureClassNamed: #MooseSpecializedGroup
]

{ #category : 'accessing' }
FmxMBRingEnvironment >> basicImportingContextSuperclass [

	^ self ringEnvironment ensureClassNamed: #FamixImportingContext
]

{ #category : 'accessing' }
FmxMBRingEnvironment >> basicModelSuperclass [

	^ self ringEnvironment ensureClassNamed: #MooseModel
]

{ #category : 'accessing' }
FmxMBRingEnvironment >> basicSuperclass [

	^ self ringEnvironment ensureClassNamed: #MooseEntity
]

{ #category : 'accessing' }
FmxMBRingEnvironment >> basicTrait [

	^ self ringEnvironment ensureClassNamed: #Trait
]

{ #category : 'accessing' }
FmxMBRingEnvironment >> builder [
	^ builder
]

{ #category : 'accessing' }
FmxMBRingEnvironment >> builder: anObject [
	builder := anObject
]

{ #category : 'initialization' }
FmxMBRingEnvironment >> classNamed: aClassName [

	^ self ringEnvironment ask behaviorNamed: aClassName
]

{ #category : 'accessing' }
FmxMBRingEnvironment >> compile: aSource in: aClass classified: aProtocol [

	aClass compile: aSource classified: aProtocol.
]

{ #category : 'accessing' }
FmxMBRingEnvironment >> compile: aSource in: aClass classified: aProtocol package: aPackageName [

	| selector |
	
	selector := aClass compile: aSource classified: aProtocol.
	(aClass methodNamed: selector) package: (aClass environment ensurePackageNamed: aPackageName).
]

{ #category : 'initialization' }
FmxMBRingEnvironment >> createClassNamed: aClassName superclass: aSuperclass traitNames: traitNames slots: slots in: packageName tag: tag comment: comment [

	| aClass existingClass composition |
	existingClass := self ringEnvironment ask behaviorNamed:
		                 aClassName asSymbol.

	aClass := self ringEnvironment ensureClassNamed: aClassName.
	aClass superclass:
		(self ringEnvironment ensureClassNamed: aSuperclass name).

	composition := RGTraitComposition parent: aClass.
	aClass traitComposition: composition.

	traitNames do: [ :each | 
		composition addTransformation:
			(self ringEnvironment ensureTraitNamed: each) ].

	aClass package:
		(self ringEnvironment ensurePackageNamed: packageName).
	aClass layout makeResolved.

	slots do: [ :slotInBadEnvironment | 
		| slot |
		slot := slotInBadEnvironment needsFullDefinition
			        ifTrue: [ 
				        (RGUnknownSlot
					         named: slotInBadEnvironment name
					         parent: aClass layout)
					        expression: slotInBadEnvironment expression;
					        yourself ]
			        ifFalse: [ 
				        RGInstanceVariableSlot
					        named: slotInBadEnvironment name
					        parent: aClass layout ].
		aClass layout addSlot: slot.
		slot propertyNamed: #isGenerated put: true ].
	
	aClass tagWith: tag.
	comment ifNotEmpty: [ aClass comment content: comment ].

	^ aClass
]

{ #category : 'initialization' }
FmxMBRingEnvironment >> createTraitNamed: traitName uses: traitNames slots: slots in: packageName tag: tag comment: comment [

	| aPackage aTrait existingClass composition |
	existingClass := self ringEnvironment ask behaviorNamed: traitName asSymbol.

	aPackage := self ringEnvironment ensurePackageNamed: packageName.

	aTrait := ringEnvironment ensureTraitNamed: traitName.
	aTrait superclass: self basicTrait.

	composition := RGTraitComposition parent: aTrait.
	aTrait traitComposition: composition.

	traitNames do: [ :each | 
		composition addTransformation:
			(self ringEnvironment ensureTraitNamed: each) ].

	aTrait package: aPackage.
	aTrait layout makeResolved.

	slots do: [ :slotInBadEnvironment | 
		| slot |
		slot := slotInBadEnvironment needsFullDefinition
			        ifTrue: [ 
				        (RGUnknownSlot
					         named: slotInBadEnvironment name
					         parent: aTrait layout)
					        expression: slotInBadEnvironment expression;
					        yourself ]
			        ifFalse: [ 
				        RGInstanceVariableSlot
					        named: slotInBadEnvironment name
					        parent: aTrait layout ].
		aTrait layout addSlot: slot.
		slot propertyNamed: #isGenerated put: true ].
	
	aTrait tagWith: tag.
	comment ifNotEmpty: [ aTrait comment content: comment ].

	^ aTrait
]

{ #category : 'initialization' }
FmxMBRingEnvironment >> hasBehaviorNamed: aClassName [

	^ self ringEnvironment ask includesClassNamed: aClassName
]

{ #category : 'initialization' }
FmxMBRingEnvironment >> initialize [

	super initialize.
	
	ringEnvironment := RGEnvironment new.
	ringEnvironment version: 7.
	ringEnvironment ensureClassNamed: #FMOne.
	ringEnvironment ensureClassNamed: #FMMany.		
	ringEnvironment ensureClassNamed: #FMMultivalueLink.
	ringEnvironment ensureClassNamed: #FMMultiMultivalueLink.
	ringEnvironment ensureClassNamed: #MooseSpecializedGroup.
]

{ #category : 'public registration' }
FmxMBRingEnvironment >> registerPackage: aPackageName [

	^ self ringEnvironment ensurePackageNamed: aPackageName.

]

{ #category : 'accessing' }
FmxMBRingEnvironment >> ringEnvironment [
	^ ringEnvironment
]

{ #category : 'initialization' }
FmxMBRingEnvironment >> slotNamed: slotName [
	^ (RGUnknownSlot named: slotName asSymbol) expression: #FMProperty
]

{ #category : 'initialization' }
FmxMBRingEnvironment >> slotNamed: slotName cardinality: cardinality type: type opposite: oppositeName [

	| cardinalityClassName |
	
	cardinalityClassName := cardinality = #one
		ifTrue: [ #FMOne ]
		ifFalse: [ #FMMany ].
		
	^ (RGUnknownSlot named: slotName asSymbol)
		 expression: ('{1} type: #{2} opposite: #{3}' 
			format: { cardinalityClassName. type. oppositeName}) 
]

{ #category : 'initialization' }
FmxMBRingEnvironment >> slotNamed: slotName defaultValue: aValue [

	aValue ifNil: [ ^ self slotNamed: slotName ].
	^ (RGUnknownSlot named: slotName asSymbol) expression:
		  ('FMProperty defaultValue: {1}' format: { aValue printString })
]
