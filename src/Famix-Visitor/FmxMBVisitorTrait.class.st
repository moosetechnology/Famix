Class {
	#name : #FmxMBVisitorTrait,
	#superclass : #FmxMBTrait,
	#category : #'Famix-Visitor'
}

{ #category : #accessing }
FmxMBVisitorTrait >> comment [

	^ 'I am a visitor for {1}Entities. 
I am generated with the metamodel.' format: { self prefix }
]

{ #category : #generating }
FmxMBVisitorTrait >> generate [

	| aTrait |
	self willGenerate ifFalse: [ ^ self ].

	aTrait := self builder environment
		          createTraitNamed: self fullName asSymbol
		          uses: {  }
		          slots: self slotDefinitions
		          in: self packageName
		          overwrite: true.

	aTrait tagWith: self tag.
	self realClass: aTrait.

	self generateAnnotationIn: aTrait superclass: nil.
	self generateVisitEntityMethod.
	self generateVisitCollectionMethod
]

{ #category : #'code generation' }
FmxMBVisitorTrait >> generateVisitCollectionMethod [

	self flag: #toRemove.
	self realClass
		compile: 'visitCollection: aCollection

	<generated>
	^ aCollection collect: [ :each | each accept: self ]'
		classified: #visiting
]

{ #category : #'code generation' }
FmxMBVisitorTrait >> generateVisitEntityMethod [

	self flag: #toRemove.

	self realClass
		compile: 'visitEntity: aFamixEntity

	<generated>
	^ aFamixEntity ifNotNil: [ aFamixEntity accept: self ]'
		classified: #visiting
]

{ #category : #initialization }
FmxMBVisitorTrait >> initialize [

	super initialize.
	name := #Visitor.
	tag := 'Trait'
]

{ #category : #testing }
FmxMBVisitorTrait >> isMetamodelTrait [

	^ false
]
