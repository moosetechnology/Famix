Extension { #name : #MooseAbstractGroup }

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allAccesses [
	
	<navigation: 'All accesses'>
	^self allUsing: FamixTAccess 
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allAnnotationInstances [
	<navigation: 'All annotation instances'>
	<package: #Java>
	^ self allUsing: FamixTAnnotationInstance
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allAnnotationTypes [
	<navigation: 'All annotation types'>
	<package: #Java>
	^ self allUsing: FamixTAnnotationType
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allAttributes [
	
	<navigation: 'All attributes'>
	^self allUsing: FamixTAttribute 
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allBehaviourals [
	<navigation: 'All behavioural entities'>
	^ self allUsing: FamixTWithStatements
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allClasses [
	<navigation: 'All classes'>
	^ self allUsing: FamixTClass ofGroupClass: FamixClassGroup
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allComments [
	
	<navigation: 'All comments'>
	^self allUsing: FamixTComment 
	
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allEnumValues [
	<navigation: 'All enum values'>
	<package: #Java>
	^ self allUsing: FamixTEnumValue 
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allEnums [
	<navigation: 'All enums'>
	<package: #Java>
	^ self allUsing: FamixTWithEnumValues  
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allFiles [
	<navigation: 'All files'>
	^ self allUsing: FamixTFile
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allFolders [
	<navigation: 'All folders'>
	^ self allUsing: FamixTFolder
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allFunctions [
	<navigation: 'All functions'>
	^ self allUsing: FamixTFunction
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allGlobalVariables [
	
	<navigation: 'All global variables'>
	^self allUsing: FamixTGlobalVariable 
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allImplicitVariables [
	
	<navigation: 'All implicit variables'>
	^self allUsing: FamixTImplicitVariable 
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allImports [
	
	<navigation: 'All imports'>
	^self allUsing: FamixTImport 
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allInheritanceDefinitions [
	<navigation: 'All inheritances'>
	^ self allUsing: FamixTInheritance
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allInvocations [
	
	<navigation: 'All invocations'>
	^self allUsing: FamixTInvocation 
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allLambdas [

	<navigation: 'All lambdas'>
	^ self allUsing: FamixTLambda
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allLocalVariables [
	
	<navigation: 'All local variables'>
	^self allUsing: FamixTLocalVariable 
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allMethods [
	<navigation: 'All methods'>
	
	^ self allUsing: FamixTMethod
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allModelBehaviourals [
	<navigation: 'All model behavioural entities'>
	^ self lookUpPropertyNamed: #allModelBehaviourals computedAs: [ self computeAllModelBehaviourals ]
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allModelClasses [
	<navigation: 'All model classes'>
	^ self cacheAt: 'All model classes' ifAbsentPut: [ MooseGroup withAll: (self allClasses reject: [ :each | each isStub ]) withDescription: 'All model classes' ]
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allModelImports [

	<navigation: 'All model imports'>
	^ self cacheAt: 'All model imports' ifAbsentPut: [ MooseGroup withAll: (self allImports reject: [ :each | each isStub ]) withDescription: 'All model imports' ]
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allModelLambdas [

	<navigation: 'All model lambdas'>
	^ self cacheAt: 'All model lambdas' ifAbsentPut: [ MooseGroup withAll: (self allLambdas reject: [ :each | each isStub ]) withDescription: 'All model lambdas' ]
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allModelMethods [
	<navigation: 'All model methods'>
	^ self cacheAt: 'All model methods' ifAbsentPut: [ self allMethods reject: [ :each | each isStub ] ]
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allModelModules [
	<navigation: 'All model modules'>
	^ self cacheAt: 'All model modules' ifAbsentPut: [ MooseGroup withAll: (self allModules reject: #isStub) withDescription: 'All model modules' ]
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allModelNamespaces [
	<navigation: 'All model namespaces'>
	^ self
		cacheAt: 'All model namespaces'
		ifAbsentPut: [ MooseGroup withAll: (self allNamespaces reject: [ :each | each isStub ]) withDescription: 'All model namespaces' ]
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allModelPackages [
	<navigation: 'All model packages'>
	^ self cacheAt: 'All model packages' ifAbsentPut: [ MooseGroup withAll: (self allPackages reject: #isStub) withDescription: 'All model packages' ]
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allModelPureClasses [
	self flag: 'this method exists only the time we manage correctly the interface'.
	^ self
		cacheAt: 'All model classes'
		ifAbsentPut: [ MooseGroup withAll: (self allClasses reject: [ :each | each isStub or: [ each isInterface ] ]) withDescription: 'All model classes' ]
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allModelStructuralEntities [
	<navigation: 'All model structural entities'>
	^ self lookUpPropertyNamed: #allModelStructuralEntities computedAs: [ self computeAllModelStructuralEntities ]
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allModelTypes [
	<navigation: 'All model types'>
	^ self cacheAt: 'All model types' ifAbsentPut: [ (self allTypes reject: [ :each | each isStub ]) description: 'All model types' ]
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allModules [
	<navigation: 'All modules'>
	^ self allUsing: FamixTModule
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allNamespaces [
	
	<navigation: 'All namespaces'>
	^self allUsing: FamixTNamespace 
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allPackages [
	
	<navigation: 'All packages'>
	^self allUsing: FamixTPackage 
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allParameterTypes [
	<navigation: 'All parameter types'>
	<package: #Java>
	^ self allUsing: FamixTParameter
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allParameters [
	
	<navigation: 'All parameters'>
	^self allUsing: FamixTParameter 
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allParametricEntities [
	<navigation: 'All parameteric entities'>
	<package: #Java>
	^ self allUsing: FamixTParametricEntity
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allPrimitiveTypes [
	<navigation: 'All primitive types'>
	^ self allUsing: FamixTPrimitiveType
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allReferences [
	
	<navigation: 'All references'>
	^self allUsing: FamixTReference  
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allStructuralEntities [
	<navigation: 'All structural entities'>
	^ self allUsing: FamixTStructuralEntity
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allTestClasses [
	<navigation: 'All test classes'>
	<package: #Java>
	^ self allModelClasses select: #isTestCase
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allTestMethods [
	<navigation: 'All test methods'>
	<package: #Java>
	^ self allModelMethods select: [ :each | 
		(each respondsTo: #isJUnit4Test) and: [ each isJUnit4Test ]]
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allTypes [
	<navigation: 'All types'>
	^ self allUsing: FamixTType ofGroupClass: FamixTypeGroup
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> allUnknownVariables [
	<navigation: 'All unknown variables'>
	^ self allUsing: FamixTUnknownVariable
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> computeAllModelBehaviourals [
	^ self allBehaviourals reject: #isStub
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> computeAllModelStructuralEntities [
	^ self allStructuralEntities reject: #isStub
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> numberOfAssociations [
	<FMProperty: #numberOfAssociations type: #Number>
	<FMComment: 'The total number of associations'>
	^ self numberOfEntityUsing: FamixTAssociation
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> numberOfEntities [
	<FMProperty: #numberOfEntities type: #Number>
	<FMComment: 'The total number of entities (items that are not associations)'>
	^ self numberOfItems - self numberOfAssociations
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> numberOfLinesOfCode [
	<FMProperty: #numberOfLinesOfCode type: #Number>
	<FMComment: 'The number of classes in the model'>
	^ self
		lookUpPropertyNamed: #numberOfLinesOfCode
		computedAs: [ self allMethods sum: #numberOfLinesOfCode ]
]

{ #category : #'*Famix-Traits' }
MooseAbstractGroup >> numberOfPackages [
	<FMProperty: #numberOfPackages type: #Number>
	<FMComment: 'Total number of packages'>
	^ self cacheAt: #numberOfPackages ifAbsentPut: [ self numberOfEntityUsing: FamixTPackage ]
]
