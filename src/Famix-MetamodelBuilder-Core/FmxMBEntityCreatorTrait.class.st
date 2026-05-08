"
The generated trait will be only used by the model.
It implements factory methods to create new entities and add them in the model.
"
Class {
	#name : 'FmxMBEntityCreatorTrait',
	#superclass : 'FmxMBTrait',
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

{ #category : 'generating' }
FmxMBEntityCreatorTrait >> generate [

	super generate.

	self builder concreteClasses do: [ :class |
			self addMethod: (FmxMBMethodsFactory instantiate: class) protocol: #'entity creation'.

			(class allTransitiveTraitsIncludingSuperclasses anySatisfy: [ :trait | trait prefix = #Famix and: [ trait name = #TNamedEntity ] ]) ifTrue: [
				self addMethod: (FmxMBMethodsFactory instantiateNamed: class) protocol: #'entity creation' ] ]
]

{ #category : 'initialization' }
FmxMBEntityCreatorTrait >> initialize [

	super initialize.
	name := #TEntityCreator.
	comment := 'This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.'.
	tag := 'Model'
]

{ #category : 'testing' }
FmxMBEntityCreatorTrait >> isEntityCreatorTrait [

	^ true
]

{ #category : 'testing' }
FmxMBEntityCreatorTrait >> isMetamodelTrait [

	^ false
]
