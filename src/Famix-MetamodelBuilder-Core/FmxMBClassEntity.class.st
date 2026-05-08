Class {
	#name : 'FmxMBClassEntity',
	#superclass : 'FmxMBClass',
	#instVars : [
		'propertiesForEqualityCheck',
		'isAbstractClass'
	],
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

{ #category : 'settings - default' }
FmxMBClassEntity >> defaultSuperclassName [
	"We have a special case with MooseObject that should inherit from Object."

	self isMooseObject ifTrue: [ ^ #Object ].

	^ super defaultSuperclassName
]

{ #category : 'generating-methods' }
FmxMBClassEntity >> generate [

	super generate.

	self
		generateIsAbstractMethodIfNecessary;
		generateAddToCollection;
		generateTestingMethods;
		generateMetamodelMethod;
		generateAnnotation.

	propertiesForEqualityCheck ifNotNil: [
			self
				generateEqualsMethod;
				generateHashMethod ]
]

{ #category : 'generating-methods' }
FmxMBClassEntity >> generateEqualsMethod [

	self addMethod: (FmxMBMethodsFactory equalsForVariableNamed: 'a' , self fullName properties: propertiesForEqualityCheck) protocol: #comparing
]

{ #category : 'generating-methods' }
FmxMBClassEntity >> generateHashMethod [

	self addMethod: (FmxMBMethodsFactory hashForProperties: propertiesForEqualityCheck) protocol: #comparing
]

{ #category : 'generating' }
FmxMBClassEntity >> generateIsAbstractMethodIfNecessary [

	self isAbstractClass ifTrue: [ self addMethod: (FmxMBMethodsFactory isAbstractFor: self fullName) classSide: true protocol: #testing ]
]

{ #category : 'generating-methods' }
FmxMBClassEntity >> generateMetamodelMethod [

	self isRoot ifFalse: [ ^ self ].

	self builder model ifNotNil: [ :model | self addMethod: (FmxMBMethodsFactory metamodelFor: model fullName) classSide: true protocol: #meta ]
]

{ #category : 'generating-methods' }
FmxMBClassEntity >> generateTestingMethods [

	self isRoot ifTrue: [
			| selectorsToGenerate |
			selectorsToGenerate := Set new.
			builder testingSelectorsMapping keysAndValuesDo: [ :concernedClass :selectors |
				(builder shouldGeneratorTestingMethodsOf: concernedClass in: self) ifTrue: [ selectorsToGenerate addAll: selectors ] ].

			(selectorsToGenerate difference: (self traitGeneralizations flatCollect: #testingSelectors)) do: [ :selector |
				self addMethod: (FmxMBMethodsFactory testReturning: false for: selector) protocol: #testing ] ].

	super generateTestingMethods
]

{ #category : 'testing' }
FmxMBClassEntity >> isAbstractClass [

	^ isAbstractClass ifNil: [ false ]
]

{ #category : 'accessing' }
FmxMBClassEntity >> isAbstractClass: aBoolean [

	isAbstractClass := aBoolean
]

{ #category : 'testing' }
FmxMBClassEntity >> isClassEntity [

	^ true
]

{ #category : 'testing' }
FmxMBClassEntity >> isConcreteClass [

	^ self isAbstractClass not
]

{ #category : 'testing' }
FmxMBClassEntity >> isMooseObject [

	^ self name = 'Object' and: [ self prefix = 'Moose' ]
]

{ #category : 'testing' }
FmxMBClassEntity >> isRoot [

	self superclass ifNotNil: [ ^ false ]. 
	
	"We have a special case with MooseObject because we do not want to consider it as a root but it inherits from Object."
	^ self isMooseObject not
]

{ #category : 'generating' }
FmxMBClassEntity >> optionalPragma [

	^ self isAbstractClass
		  ifTrue: [ 
			  '
	<abstract>' ]
		  ifFalse: [ super optionalPragma ]
]

{ #category : 'generalization' }
FmxMBClassEntity >> withEqualityCheckOn: aCollectionOfPropertySymbol [

	propertiesForEqualityCheck := aCollectionOfPropertySymbol
]
