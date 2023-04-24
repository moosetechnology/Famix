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
FmxMBEntityCreatorTrait >> generate [

	super generate.
	
	self builder classes
		select: [ :cls | 
			cls isAbstractClass not and: [ cls isMetamodelClassGroup not ] ]
		thenDo: [ :cls | 
			self builder environment
				compile: ('new{1}

	<generated>
	^ self add: {2} new' format: { 
							 cls name.
							 cls fullName })
				in: self realClass
				classified: 'entity creation' ]
]

{ #category : #initialization }
FmxMBEntityCreatorTrait >> initialize [

	super initialize.
	name := #TEntityCreator.
	comment := 'This trait is used by Famix models.
It provides an API for creating new entities and adding them in the model.'.
	tag := 'Model'
]
