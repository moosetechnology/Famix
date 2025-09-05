Extension { #name : 'MooseModel' }

{ #category : '*Famix-Traits' }
MooseModel >> allModelEntities [

	<navigation: 'All model entities'>
	^ self cacheAt: #allModelEntities ifAbsent: [ self entities reject: #isStub ]
]

{ #category : '*Famix-Traits' }
MooseModel >> allSourceLanguages [

	^ self allUsing: FamixTSourceLanguage.

]

{ #category : '*Famix-Traits' }
MooseModel >> averageCyclomaticComplexity [

	<FMProperty: #averageCyclomaticComplexity type: #Number>
	<derived>
	<FMComment: 'The average cyclomatic complexity for methods'>
	^ self cacheAt: #averageCyclomaticComplexity ifAbsentPut: [ (self allMethods collect: #cyclomaticComplexity) ifEmpty: [ 1 ] ifNotEmpty: #average ]
]

{ #category : '*Famix-Traits' }
MooseModel >> numberOfClassesPerPackage [

	<FMProperty: #numberOfClassesPerPackage type: #Number>
	<FMComment: 'The number of methods per package in the model'>
	^ self cacheAt: #numberOfClassesPerPackage ifAbsentPut: [ self numberOfMethods / self numberOfClasses ]
]

{ #category : '*Famix-Traits' }
MooseModel >> numberOfLinesOfCodePerMethod [

	<FMProperty: #numberOfLinesOfCodePerMethod type: #Number>
	<FMComment: 'The number of lines of code per method in the model'>
	^ self cacheAt: #numberOfLinesOfCodePerMethod ifAbsentPut: [ self numberOfLinesOfCode / self numberOfMethods ]
]

{ #category : '*Famix-Traits' }
MooseModel >> numberOfLinesOfCodePerPackage [

	<FMProperty: #numberOfLinesOfCodePerPackage type: #Number>
	<FMComment: 'The number of lines of code per package in the model'>
	^ self cacheAt: #numberOfLinesOfCodePerPackage ifAbsentPut: [ self numberOfLinesOfCode / self numberOfPackages ]
]

{ #category : '*Famix-Traits' }
MooseModel >> numberOfMethods [

	<FMProperty: #numberOfMethods type: #Number>
	<FMComment: 'The number of methods'>
	^ self cacheAt: #numberOfMethods ifAbsentPut: [ self allMethods size ]
]

{ #category : '*Famix-Traits' }
MooseModel >> numberOfMethodsPerPackage [

	<FMProperty: #numberOfClassesPerPackage type: #Number>
	<FMComment: 'The number of methods per package in the model'>
	^ self cacheAt: #numberOfMethodsPerPackage ifAbsentPut: [ self numberOfMethods / self numberOfPackages ]
]

{ #category : '*Famix-Traits' }
MooseModel >> numberOfModelClasses [

	<FMProperty: #numberOfModelClasses type: #Number>
	<FMComment: 'The number of classes in the model'>
	^ self cacheAt: #numberOfModelClasses ifAbsentPut: [ self allModelClasses size ]
]

{ #category : '*Famix-Traits' }
MooseModel >> numberOfModelMethods [

	<FMProperty: #numberOfModelMethods type: #Number>
	<FMComment: 'The number of methods in the model'>
	^ self cacheAt: #numberOfModelMethods ifAbsentPut: [ self allModelMethods size ]
]

{ #category : '*Famix-Traits' }
MooseModel >> sourceLanguage [
	<FMProperty: #sourceLanguage type: #FamixTSourceLanguage>
	<FMComment: 'Source of the Language to which the model corresponds'>
	^ self
		attributeAt: #sourceLanguage
		ifAbsentPut: [ self allSourceLanguages
				detect: [ :each | each isAttached not ]
				ifNone: [ nil ] ]
]

{ #category : '*Famix-Traits' }
MooseModel >> sourceLanguage: aFamixSourceLanguage [
	self attributeAt: #sourceLanguage put: aFamixSourceLanguage.
	aFamixSourceLanguage mooseModel: self
]
