"
I'm responsible for creating Famix model out of Smalltalk code.
I'm mainly invoked by the MooseImportClassesTask
"
Class {
	#name : #FamixStImporter,
	#superclass : #Object,
	#traits : 'FamixStTImportUtils',
	#classTraits : 'FamixStTImportUtils classTrait',
	#instVars : [
		'methods',
		'namespaces',
		'packages',
		'globals',
		'scopes',
		'others',
		'implicitVariables',
		'annotationTypes'
	],
	#category : #'Moose-SmalltalkImporter-Importers'
}

{ #category : #constant }
FamixStImporter class >> CIVString [

	^ 'CIV#'
]

{ #category : #'private accessing' }
FamixStImporter >> CIVString [

	^ self class CIVString
]

{ #category : #'private accessing' }
FamixStImporter >> addEntity: value [ 
	 
	^others add: value
]

{ #category : #enumerating }
FamixStImporter >> allElements [ 
	 
	| stream | 
	stream := (OrderedCollection new: self size) writeStream. 
	stream nextPutAll: others. 
	stream nextPutAll: methods values. 
	stream nextPutAll: self famixClasses. 
	stream nextPutAll: namespaces values. 
	stream nextPutAll: packages values. 
	stream nextPutAll: globals values. 
	scopes do: [:each | stream nextPutAll: each values]. 
	^stream contents
]

{ #category : #'private utils' }
FamixStImporter >> allImplementorsOf: aSignature [
	^(SystemNavigation default allImplementorsOf: (aSignature copyUpTo: $( ) asSymbol)
		collect: #compiledMethod
]

{ #category : #'private-entity-creation' }
FamixStImporter >> basicClassCreation: aClass [

	| class anchor |

	class := classes at: aClass put: self factory classEntity new.
	class name:
		(aClass name asString replaceAll: Character space with: $_) asSymbol.
	class stub: true.
	self importingContext shouldImportNamespace ifTrue: [
		class typeContainer: (self ensureNamespace: aClass environment) ].
	anchor := self factory anchor new
		          element: class;
		          pharoEntity: aClass;
		          yourself.
	class sourceAnchor: anchor.
	self addEntity: anchor.
	^ class
]

{ #category : #'private-entity-creation' }
FamixStImporter >> basicCreateMethod: aSelector withSignature: aSignature [
	| method |
	method := self factory method new.
	method name: aSelector.
	method isStub: true.
	method signature: aSignature.
	method isAbstract: false.
	^ method
	
]

{ #category : #'private utils' }
FamixStImporter >> checkAbstractClass: class [ 
	class isAbstract:  (class methods contains: [ :each | each isAbstract ]) 
]

{ #category : #'private-entity-creation' }
FamixStImporter >> createAnnotationType: aPragmaNode [

	| pragmaAnnotationType |
	pragmaAnnotationType := annotationTypes
		                        at: aPragmaNode selector
		                        put: self factory annotationType new.
	pragmaAnnotationType name: aPragmaNode selector.
	aPragmaNode selector isUnary ifFalse: [
		(aPragmaNode selector piecesCutWhere: [ :a :b | a = $: ]) do: [
			:each |
			| attribute |
			attribute := self factory annotationTypeAttribute new.
			attribute name: (each withoutSuffix: ':').
			attribute parentAnnotationType: pragmaAnnotationType.
			self addEntity: attribute ] ].
	^ pragmaAnnotationType
]

{ #category : #'private-entity-creation' }
FamixStImporter >> createAttribute: name for: aClass [

	| attribute realName possibleTypes |
	realName := self nameForInstanceVariable: name class: aClass.
	attribute := (self scopeOfClass: aClass)
		             at: realName
		             bind: self factory attribute new.
	attribute stub: true.
	attribute name: realName asSymbol.
	self importingContext shouldMergeClassAndMetaclass
		ifTrue: [
		attribute parentType: (self ensureClass: aClass instanceSide) ]
		ifFalse: [ attribute parentType: (self ensureClass: aClass) ].
	attribute isClassSide: aClass isMeta.
	"now we use RoelTyper to see a unique type can be retrieve for this attribute: "
	self importingContext shouldComputeTypeOfAttributes ifTrue: [
		possibleTypes := (TypeCollector
			                  typeInstvar: name asSymbol
			                  ofClassWithLookup: aClass) types.
		possibleTypes size = 1 ifTrue: [
			attribute typing: (FamixStEntityTyping new declaredType:
					 (self ensureClass: possibleTypes first instanceSide)) ] ].
	^ attribute
]

{ #category : #'private-entity-creation' }
FamixStImporter >> createClass: aClass [

	| class inheritance |
	class := (self importingContext shouldMergeClassAndMetaclass and: [ aClass isMeta ])
		         ifTrue: [ classes at: aClass put: (self ensureClass: aClass soleInstance) ]
		         ifFalse: [ self basicClassCreation: aClass ].

	self importingContext shouldImportPackage ifTrue: [ class parentPackage: (self ensurePackage: aClass package) ].

	self importingContext shouldImportInheritance ifTrue: [
		(aClass superclass isNotNil and: [
			 self importingContext shouldMergeClassAndMetaclass
				 ifFalse: [ true ]
				 ifTrue: [ aClass isMeta not ] ]) ifTrue: [
			inheritance := self addEntity: self factory inheritance new.
			inheritance superclass: (self ensureClass: aClass superclass).
			inheritance subclass: class ] ].

	aClass isMeta ifFalse: [ self ensureClass: aClass class ].

	self importingContext shouldImportAttribute ifTrue: [
		aClass instVarNames do: [ :eachName | self ensureAttribute: eachName for: aClass ].
		"since the classVar of a class are not the same as the classVar of the class class"
		"with latest pharo class classVar = class class classVar so we should not need that anymore"
		aClass isMeta
			ifTrue: [ aClass soleInstance classVarNames do: [ :eachClassVarName | self ensureClassVarAttribute: eachClassVarName for: aClass soleInstance ] ]
			ifFalse: [ aClass classVarNames do: [ :eachClassVarName | self ensureClassVarAttribute: eachClassVarName for: aClass ] ] ].

	(self importingContext shouldImportComment and: [ aClass hasComment ]) ifTrue: [
		(self importingContext shouldMergeClassAndMetaclass and: [ aClass isMeta ]) ifFalse: [
			| comment anchor |
			comment := self addEntity: self factory comment new.
			anchor := self factory sourceTextAnchor new
				          element: comment;
				          source: aClass comment asString;
				          yourself.
			comment sourceAnchor: anchor.
			comment commentedEntity: class ] ].

	^ class
]

{ #category : #'private-entity-creation' }
FamixStImporter >> createClassVarAttribute: name for: aClass [
	"a classVar always belongs to the base class"

	| attribute |
	attribute := self factory attribute new.
	(self scopeOfClass: aClass) at: name bind: attribute.
	(self scopeOfClass: aClass class) at: name bind: attribute.
	attribute stub: true.
	attribute name: name asSymbol.
	attribute parentType: (self ensureClass: aClass instanceSide).
	attribute isClassSide: true.
	attribute beSharedVariable.
	^ attribute
]

{ #category : #'private-entity-creation' }
FamixStImporter >> createGlobalVariable: name value: value [

	| global |
	global := globals at: name put: self factory globalVariable new.
	global name: name.
	global typing: (self factory entityTyping new declaredType:
			 (self ensureClass: value class)).
	^ global
]

{ #category : #'private-entity-creation' }
FamixStImporter >> createMethod: aCompiledMethod [

	| method anchor |
	method := self createStubMethod: aCompiledMethod.
	self importingContext shouldImportMethodBody ifTrue: [
		| visitor |
		visitor := SmalltalkMethodVisitor on: self.
		visitor runWith: aCompiledMethod and: method ].
	anchor := self factory anchor new
		          element: method;
		          pharoEntity: aCompiledMethod;
		          yourself.
	method sourceAnchor: anchor.
	self addEntity: anchor.
	^ method
]

{ #category : #'private-entity-creation' }
FamixStImporter >> createNamespace: aNamespace [ 
	
	| namespace |
	namespace := namespaces
		at: aNamespace asString asSymbol
		put: self factory namespace new.
	namespace name: 'Smalltalk'.
	^namespace
]

{ #category : #'private-entity-creation' }
FamixStImporter >> createPackage: aPackageModel [
	
	| package |
	package := packages
		at: aPackageModel
		put: self factory package new.
	package name: aPackageModel name.
	package stub: true.
	^package
]

{ #category : #'private-entity-creation' }
FamixStImporter >> createSpecialVariable: name forClass: aClass [

	| attribute |
	attribute := (self scopeOfClass: aClass) at: name bind: self factory implicitVariable new.
	attribute name: name.
	attribute container: (self ensureClass: aClass).	
	^attribute
]

{ #category : #'private-entity-creation' }
FamixStImporter >> createSpecialVariable: name forFamixMethod: aFamixMethod [

	| attribute |
	attribute := "(self scopeOfClass: aClass) at: name bind:" self factory implicitVariable new.
	attribute name: name.
	attribute parentBehaviouralEntity: aFamixMethod.
	^attribute
]

{ #category : #'private-entity-creation' }
FamixStImporter >> createStubMethod: aCompiledMethod [
	"private-entity-creation"

	"same as #createMethod but does not import body"

	| method thisClass |
	method := self basicCreateMethod: aCompiledMethod selector withSignature: aCompiledMethod signature.
	methods at: aCompiledMethod put: method.
	thisClass := aCompiledMethod methodClass.
	method parentType: (self ensureClass: thisClass).
	"here we have two possibilities for the parentPackage of the method: 
	=> the method belong to a package extension, we should refer to this extending packages 
	=> if not, we should not refer to package of the class"
	"parentPackage := aCompiledMethod methodClass package."
	aCompiledMethod methodClass extendingPackages do: [ :aPackage |
		(aCompiledMethod isExtension and: [ aCompiledMethod package = aPackage ]) ifTrue: [ method parentPackage: (self ensurePackage: aPackage) ] ].
	method
		isClassSide: aCompiledMethod methodClass isMeta;
		protocol: aCompiledMethod protocolName;
		timeStamp: aCompiledMethod timeStamp.
	^ method
]

{ #category : #'private-entity-creation' }
FamixStImporter >> createUnknownVariable: name [

	| unknown |
	unknown := globals
		at: name
		put: self factory unknownVariable new.
	unknown name: name.
	^unknown
]

{ #category : #enumerating }
FamixStImporter >> do: aBlock [ 
	 
	others do: aBlock. 
	methods do: aBlock. 
	self famixClasses do: aBlock. 
	namespaces do: aBlock. 
	packages do: aBlock. 
	globals do: aBlock. 
	annotationTypes do: aBlock. 
	implicitVariables values do: [:aDictionary | 
		aDictionary do: aBlock
		].
	"Shared variables are both in class and metaclass scopes.
	To avoid duplicate refs in the moose model, we reject them from metaclass
	before adding them to the model"
	scopes keysAndValuesDo: [:cl :scope | 
		cl isMeta
			ifTrue: [	(scope values reject: [:var | var isSharedVariable]) do: aBlock ]
			ifFalse: [ scope do: aBlock ]].

]

{ #category : #'public-entity-creation' }
FamixStImporter >> ensureAnnotationType: aPragmaNode [
	 
	^annotationTypes 
		at: aPragmaNode selector
		ifAbsent: [self createAnnotationType: aPragmaNode]
]

{ #category : #'public-entity-creation' }
FamixStImporter >> ensureAttribute: name for: aClass [ 
	 
	^(self scopeOfClass: aClass) 
		at: (self nameForInstanceVariable: name class: aClass) 
		ifAbsent: [self createAttribute: name for: aClass]
]

{ #category : #'public-entity-creation' }
FamixStImporter >> ensureClass: aClass [

	"aClass is aSmalltalk. This method returns a FamixStClass"

	^ classes at: aClass ifAbsent: [ self createClass: aClass ]
]

{ #category : #'public-entity-creation' }
FamixStImporter >> ensureClassVarAttribute: name for: aClass [


	^(self scopeOfClass: aClass)
			at: name
			ifAbsent:
				[self
					createClassVarAttribute: name
					for: aClass]
]

{ #category : #'public-entity-creation' }
FamixStImporter >> ensureGlobalVariable: name value: value [ 
	 
	^globals 
		at: name 
		ifAbsent: [self createGlobalVariable: name value: value]
]

{ #category : #'public-entity-creation' }
FamixStImporter >> ensureImplicitVariable: name inClass: aClass [
	
	^(self scopeOfClass: aClass)
		at: name
		ifAbsent:
			[self
				createSpecialVariable: name
				forClass: aClass]
]

{ #category : #'public-entity-creation' }
FamixStImporter >> ensureImplicitVariable: name inFamixMethod: aFAMIXMethod [
	
	"^ others detect: [:aFamixEntity |
		aFamixEntity mooseName = (aFAMIXMethod mooseName,'.',name) asSymbol
		] ifNone: [
			self createSpecialVariable: name forFamixMethod: aFAMIXMethod
		]."
	
	"I'm not sure using a dictionary of dictionaries is the best solution, But it is at least really better than the first solution above"
	^ (implicitVariables at: aFAMIXMethod ifAbsentPut: [Dictionary new])
		at: name ifAbsentPut: [self createSpecialVariable: name forFamixMethod: aFAMIXMethod].
]

{ #category : #'public-entity-creation' }
FamixStImporter >> ensureMethod: aCompiledMethod [ 
	 
	^methods 
		at: aCompiledMethod 
		ifAbsent: [self createMethod: aCompiledMethod]
]

{ #category : #'public-entity-creation' }
FamixStImporter >> ensureNamespace: aNamespace [
	^ namespaces at: aNamespace asString asSymbol ifAbsent: [ self createNamespace: aNamespace ]
]

{ #category : #'public-entity-creation' }
FamixStImporter >> ensurePackage: aPackageModel [ 
	 
	^packages 
		at: aPackageModel 
		ifAbsent: [self createPackage: aPackageModel]
]

{ #category : #'public-entity-creation' }
FamixStImporter >> ensureSmalltalkStubMethod: aCompiledMethod [

	^ methods
		  at: aCompiledMethod
		  ifAbsent: [ self createStubMethod: aCompiledMethod ]
]

{ #category : #'public-entity-creation' }
FamixStImporter >> ensureSmalltalkStubMethodsFor: aSignature [

	| implementors |
	self importingContext shouldImportSmalltalkStubMethod ifFalse: [ ^ #(  ) ].
	implementors := self allImplementorsOf: aSignature.
	implementors ifEmpty: [ ^ { (self basicCreateMethod: (aSignature copyUpTo: $() withSignature: aSignature) } ].
	^ implementors collect: [ :meth | self ensureSmalltalkStubMethod: meth ]
]

{ #category : #'public-entity-creation' }
FamixStImporter >> ensureUnknownVariable: name [
	
	^globals
		at: name
		ifAbsent: [self createUnknownVariable: name]
]

{ #category : #accessing }
FamixStImporter >> famixClasses [
	"I return the Famix classes created by this importer. These classes might merge Smalltalk classes and metaclasses."
	
	^ classes values asSet
]

{ #category : #importing }
FamixStImporter >> importClass: aClass [

	| class |
	self importingContext shouldImportClass ifFalse: [ ^ self ].

	class := self ensureClass: aClass.
	class stub: false.
	class attributes do: [ :each | each stub: false ].

	self importingContext shouldImportPackage ifTrue: [ class parentPackage stub: false ].

	self importingContext shouldImportSubclasses ifTrue: [ aClass subclasses do: [ :each | self ensureClass: each ] ].

	self importingContext shouldImportMethod ifTrue: [
		aClass methods do: [ :each | (self ensureMethod: each) isStub: false ].
		self checkAbstractClass: class ].

	aClass isMeta ifFalse: [ self importClass: aClass class ]
]

{ #category : #importing }
FamixStImporter >> importClassExtension: aClassExtension [

	| method |
	self importingContext shouldImportClassExtension ifFalse: [ ^ self ].

	method := (self ensureMethod: aClassExtension) isStub: false.

	self importingContext shouldImportPackage ifTrue: [ method parentPackage isStub: false ]
]

{ #category : #initialization }
FamixStImporter >> initialize [ 
	super initialize. 
	methods := IdentityDictionary new. 
	classes := IdentityDictionary new. 
	namespaces := IdentityDictionary new. 
	packages := IdentityDictionary new. 
	globals := Dictionary new. 
	others := OrderedCollection new. 
	scopes := IdentityDictionary new.
	implicitVariables := IdentityDictionary new.
	annotationTypes := IdentityDictionary new.
]

{ #category : #'private accessing' }
FamixStImporter >> methods [
	
	^ methods
]

{ #category : #'private utils' }
FamixStImporter >> nameForInstanceVariable: name class: aClass [

	self importingContext shouldMergeClassAndMetaclass and: [ aClass isMeta ifTrue: [ ^ self CIVString , name ] ].
	^ name
]

{ #category : #'private-entity-creation' }
FamixStImporter >> scopeOfClass: aClass [
	aClass ifNil: [ ^ nil ].
	^ scopes at: aClass ifAbsentPut: [ SmalltalkScope extend: (self scopeOfClass: aClass superclass) ]
]

{ #category : #accessing }
FamixStImporter >> size [ 
	 
	^(scopes sumNumbers: #size) + others size + methods size + self famixClasses size 
		+ packages size + namespaces size + globals size
]
