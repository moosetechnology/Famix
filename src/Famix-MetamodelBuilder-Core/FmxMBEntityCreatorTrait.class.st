"
The generated trait will be only used by the model.
It implements factory methods to create new entities and add them in the model.
"
Class {
	#name : #FmxMBEntityCreatorTrait,
	#superclass : #FmxMBTrait,
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #generating }
FmxMBEntityCreatorTrait >> generateEntityCreationMethodFor: aClass [

	self builder environment
		compile: ('new{1}

	<generated>
	^ self add: {2} new' format: { 
					 aClass name.
					 aClass fullName })
		in: self realClass
		classified: 'entity creation'
]

{ #category : #generating }
FmxMBEntityCreatorTrait >> generateEntityCreationMethods [

	self builder classes
		reject: [ :aClass | aClass isAbstractClass or: [ aClass isModelClass or: [ aClass isMetamodelClassGroup ] ] ]
		thenDo: [ :class |
				self generateEntityCreationMethodFor: class.
				(class allTransitiveTraitsIncludingClassGeneralization anySatisfy: [ :trait | trait prefix = #Famix and: [ trait name = #TNamedEntity ] ]) ifTrue: [
					self generateNamedEntityCreationMethodFor: class ] ]
]

{ #category : #generating }
FmxMBEntityCreatorTrait >> generateNamedEntityCreationMethodFor: aClass [

	^ self builder environment
		  compile: ('new{1}Named: aName

	<generated>
	^ self add: ({2} named: aName)' format: { 
					   aClass name.
					   aClass fullName })
		  in: self realClass
		  classified: 'entity creation'
]

{ #category : #initialization }
FmxMBEntityCreatorTrait >> initialize [

	super initialize.
	name := #TEntityCreator.
	comment := 'This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.'.
	tag := 'Model'
]

{ #category : #testing }
FmxMBEntityCreatorTrait >> isEntityCreatorTrait [

	^ true
]

{ #category : #testing }
FmxMBEntityCreatorTrait >> isMetamodelTrait [

	^ false
]
