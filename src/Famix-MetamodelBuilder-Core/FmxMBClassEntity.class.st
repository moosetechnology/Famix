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

{ #category : 'generating-methods' }
FmxMBClassEntity >> generate [

	super generate.

	self
		generateIsAbstractMethodIfNecessary;
		generateAddToCollection;
		generateTestingMethods.

	propertiesForEqualityCheck ifNotNil: [
			self
				generateEqualsMethod;
				generateHashMethod ]
]

{ #category : 'generating-methods' }
FmxMBClassEntity >> generateEqualsMethod [

	| code |
	code := String streamContents: [ :stream |
			        | variableName |
			        variableName := 'a' , self fullName.
			        stream << '= '.
			        stream << variableName.
			        stream << '

	<generated>
	^ '.
			        stream
				        << variableName;
				        << ' ';
				        << propertiesForEqualityCheck first;
				        << ' = self ';
				        << propertiesForEqualityCheck first.
			        propertiesForEqualityCheck size > 1 ifTrue: [
					        2 to: propertiesForEqualityCheck size do: [ :idx |
							        stream << ' and: [ '.
							        stream
								        << variableName;
								        << ' ';
								        << (propertiesForEqualityCheck at: idx);
								        << ' = self ';
								        << (propertiesForEqualityCheck at: idx) ].
					        2 to: propertiesForEqualityCheck size do: [ :idx | stream << '] ' ] ] ].

	self addMethod: code protocol: #comparing
]

{ #category : 'generating-methods' }
FmxMBClassEntity >> generateHashMethod [

	| code |
	code := String streamContents: [ :stream |
			        stream << 'hash'.
			        stream << '

	<generated>
	^ '.
			        stream
				        << 'self ';
				        << propertiesForEqualityCheck first;
				        << ' hash '.
			        propertiesForEqualityCheck size > 1 ifTrue: [
					        2 to: propertiesForEqualityCheck size do: [ :idx |
							        stream
								        << 'bitXor: self ';
								        << (propertiesForEqualityCheck at: idx);
								        << ' hash ' ] ] ].

	self addMethod: code protocol: #comparing
]

{ #category : 'generating' }
FmxMBClassEntity >> generateIsAbstractMethodIfNecessary [

	self isAbstractClass ifTrue: [
			self
				addMethod: ('isAbstract

	<generated>
	^ self == {1}' format: { self fullName })
				classSide: true
				protocol: #testing ]
]

{ #category : 'generating-methods' }
FmxMBClassEntity >> generateTestingMethods [

	self isRoot ifTrue: [
			| selectorsToGenerate |
			selectorsToGenerate := Set new.
			builder testingSelectorsMapping keysAndValuesDo: [ :concernedClass :selectors |
				(builder shouldGeneratorTestingMethodsOf: concernedClass in: self) ifTrue: [ selectorsToGenerate addAll: selectors ] ].

			(selectorsToGenerate difference: (self traitGeneralizations flatCollect: #testingSelectors)) do: [ :sel |
				self addMethod: (sel , '\\	<generated>\	^ false') withCRs protocol: #testing ] ].

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
FmxMBClassEntity >> isConcreteClass [

	^ self isAbstractClass not
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
