"
A Pharo code generator to implement the basic infrastructure for Famix/FAST visitors.
Generates visit calls to superclass and used traits of each Famix entity.
Also generates #accept: calls for all relation of the Famix entities.
Also generates the `#accept:` methods in the Famix entities.

To use:
```
FamixVisitorCodeGenerator new
	package: 'Famix-Traits' visitorClass: FamixTTraitVisitor .

FamixVisitorCodeGenerator new
	package: 'Famix-Java-Entities' visitorClass: FamixJavaVisitor .
```

Other method: `#generateAcceptMethodsForClasses: aCollectionOfClassesOrTraits`


Assumptions:
- Classes and traits of the meta-model are all gathered in one package 
- The visitor class should exist
- The `#accept:` methods are generated in the model entities (classes of the package) as extension of the package owning the visitor class

Thus for FAST-Java:
- Meta-model classes and traits are located in one package (FAST-Java-entities)
- The visitor is FASTJavaVisitor, located in FAST-Java-Visitor package
- `#accept:` methods in the meta-model classes will be extension of the FAST-Java-Visitor package
"
Class {
	#name : #FamixVisitorCodeGenerator,
	#superclass : #Object,
	#instVars : [
		'generateAccepts',
		'package',
		'visitorTrait'
	],
	#category : #'Famix-Visitor'
}

{ #category : #private }
FamixVisitorCodeGenerator >> asParameterName: aModelClass [
	"generates a parameter name from a class name"

	^'a' , aModelClass name
]

{ #category : #private }
FamixVisitorCodeGenerator >> compileVisitMethod: code for: aModelClass [
	"visiting method are compiled in the visitorClass"

	visitorTrait compile: code classified: (aModelClass isTrait
		ifTrue: [ 'visiting - traits' ]
		ifFalse: [ 'visiting' ])
]

{ #category : #'code generation' }
FamixVisitorCodeGenerator >> generateAcceptCall: slot on: stream [

	stream
		<< '	self acceptMeIfNotNil: '
		<< (self asParameterName: slot definingClass) ;
		space ;
		<< slot name ;
		<< '.' ;
		cr

]

{ #category : #'code generation' }
FamixVisitorCodeGenerator >> generateAcceptForRelations: aModelClass on: stream [
	"relations are slot with either FMMany or FMOne type
	 visited only if they are defined in aModelClass
	 otherwise, they will be visited while visiting the trait used by aModelClass"

	aModelClass slots do: [ :slot |
		(slot definingClass = aModelClass)
			ifTrue: [
				(slot class = FMOne)
					ifTrue: [ self generateAcceptCall: slot on: stream ].
				(slot class = FMMany)
					ifTrue: [ self generateVisitListCall: slot on: stream ]
		]
	]
]

{ #category : #'code generation' }
FamixVisitorCodeGenerator >> generateAcceptIfNotNilMethod [

	self
		compileVisitMethod: 
'acceptMeIfNotNil: aFamixEntity
	<generated>

	^aFamixEntity ifNil: [ nil ] ifNotNil: [ aFamixEntity accept: self ]
'
		for: visitorTrait 
]

{ #category : #'code generation' }
FamixVisitorCodeGenerator >> generateAcceptMethod: modelClass [
	"generates an #accept: method in modelClass as extension of the package of the visitorClass.
	 Note the trick in calling #generateVisitCallFor:receiver:argument:on: where the 'receiver'
	 includes a return statement"

	| code |
	generateAccepts ifFalse: [ ^self ].

	code := String streamContents: [ :stream |
		stream <<
'accept: aVisitor
	<generated>

'.

		self generateVisitCall: modelClass receiver: '^ aVisitor' argument: 'self' on: stream
	].

	modelClass compile: code classified: '*' , visitorTrait package name
]

{ #category : #run }
FamixVisitorCodeGenerator >> generateAcceptMethodsForClasses: aCollection [
	"generates #accept: methods for all classes in aCollection"

	aCollection do: [ :class | self generateAcceptMethod: class ]
]

{ #category : #accessing }
FamixVisitorCodeGenerator >> generateAccepts [

	^ generateAccepts
]

{ #category : #accessing }
FamixVisitorCodeGenerator >> generateAccepts: anObject [

	generateAccepts := anObject
]

{ #category : #'code generation' }
FamixVisitorCodeGenerator >> generateVisitCall: modelClass receiver: receiver argument: argument on: stream [
	"generates an invocation of #visit: , with an argument of type modelClass"

	stream
		tab ;
		<< receiver ;
		space.

	self generateVisitSelector: modelClass parameter: argument on: stream.
	stream
		<< '.' ;
		cr
]

{ #category : #'code generation' }
FamixVisitorCodeGenerator >> generateVisitListCall: slot on: stream [

	stream
		<< '	self visitList: ' ;
		<< (self asParameterName: slot definingClass) ;
		space ;
		<< slot name ;
		<< '.' ;
		cr

]

{ #category : #'code generation' }
FamixVisitorCodeGenerator >> generateVisitListMethod [

	self
		compileVisitMethod: 
'visitList: aCollection
	<generated>

	^aCollection collect: [ :each | each accept: self ]
'
		for: visitorTrait 
]

{ #category : #'code generation' }
FamixVisitorCodeGenerator >> generateVisitMethod: aModelClass [

	| code |
	code := String streamContents: [ :stream |
		self generateVisitMethodHeader: aModelClass on: stream.
		self generateVisitMethodBody: aModelClass on: stream ].

	self compileVisitMethod: code for: aModelClass
]

{ #category : #'code generation' }
FamixVisitorCodeGenerator >> generateVisitMethodBody: aModelClass on: stream [
	"generates calls to #visitSomeTrait: for used traits
	 generates a call to #visit<superclass>:
	 generates calls to #accept: method for relationship slots"

	self generateVisitToTraits: aModelClass on: stream.
	self generateVisitToSuperclass: aModelClass on: stream.
	self generateAcceptForRelations: aModelClass on: stream
]

{ #category : #'code generation' }
FamixVisitorCodeGenerator >> generateVisitMethodHeader: aModelClass on: stream [

	self
		generateVisitSelector: aModelClass
		parameter: (self asParameterName: aModelClass)
		on: stream.

	stream <<
'
	<generated>

'
]

{ #category : #'code generation' }
FamixVisitorCodeGenerator >> generateVisitSelector: aModelClass parameter: parameter on: stream [

	stream
		<< 'visit';
		<< aModelClass name;
		<< ': ';
		<< parameter
]

{ #category : #'code generation' }
FamixVisitorCodeGenerator >> generateVisitToSuperclass: aModelClass on: stream [

	aModelClass superclass ifNotNil: [ :superclass |
		(self isRootClass: superclass) ifFalse: [
			self
				generateVisitCall: superclass
				receiver: 'self'
				argument: (self asParameterName: aModelClass)
				on: stream
		]
	]
]

{ #category : #'code generation' }
FamixVisitorCodeGenerator >> generateVisitToTraits: aModelClass on: stream [
	"generates calls to traits used by aModelClass and not used by its super-classes
	 (because they will alreay have a class to visit that trait)"

	(self traitsToVisitFor: aModelClass) do: [ :aTrait |
		self
			generateVisitCall: aTrait
			receiver: 'self'
			argument: (self asParameterName: aModelClass)
			on: stream ].
]

{ #category : #initialization }
FamixVisitorCodeGenerator >> initialize [ 

	super initialize.

	generateAccepts := true
]

{ #category : #testing }
FamixVisitorCodeGenerator >> isClassModel: aClass [

	^aClass superclass = MooseModel
]

{ #category : #testing }
FamixVisitorCodeGenerator >> isRootClass: aClass [
	"assuming all classes are in the same package,
	 so the root class is the one with a superclass outside package"

	aClass isTrait ifTrue: [ ^false ].
	(aClass superclass package = package) ifTrue: [ ^false ].
	^true
]

{ #category : #accessing }
FamixVisitorCodeGenerator >> package [

	^ package
]

{ #category : #accessing }
FamixVisitorCodeGenerator >> package: anObject [
	"anObject should be a Pharo package or the name of a package"

	package := anObject isString
		ifTrue: [ PackageOrganizer default packageNamed: anObject ]
		ifFalse: [ anObject ]
]

{ #category : #run }
FamixVisitorCodeGenerator >> package: aFamixPackage visitorClass: aVisitorClass [
	"entry point for the generation.
	 For all all classes/traits in aFamixPackage, generates an #accept: method in that class and
	 a #visit: method in aVisitorClass
	 (do not generate for the Famix...Model class) "

	self package: aFamixPackage.
	visitorTrait := aVisitorClass.

	self generateVisitListMethod.
	self generateAcceptIfNotNilMethod.

	package definedClasses do: [ :modelClass |
		(self shouldIgnoreClass: modelClass)
			ifFalse: [
				self generateAcceptMethod: modelClass.
				self generateVisitMethod: modelClass
			]
	].

]

{ #category : #testing }
FamixVisitorCodeGenerator >> shouldIgnoreClass: aClass [

	^{ MooseModel . MooseSpecializedGroup } anySatisfy: [ :sup | aClass superclass = sup ]
]

{ #category : #private }
FamixVisitorCodeGenerator >> trait: aTrait usedBySuperClassOf: aModelClass [

	| superclass |
	(self isRootClass: aModelClass) ifTrue: [ ^false ].

	superclass := aModelClass superclass.
	superclass ifNil: [ ^false ].

	(superclass traits includes: aTrait) ifTrue: [ ^true ].

	^self trait: aTrait usedBySuperClassOf: aModelClass superclass
]

{ #category : #private }
FamixVisitorCodeGenerator >> traitsToVisitFor: aModelClass [
	"gather the traits used by aModelClass that are not used by any of its super-classes
	The root class is assumed to not use any trait"

	(self isRootClass: aModelClass) ifTrue: [ ^#() ].

	^aModelClass traits reject: [ :aTrait | self trait: aTrait usedBySuperClassOf: aModelClass ]
]

{ #category : #accessing }
FamixVisitorCodeGenerator >> visitorClass [

	^ visitorTrait
]

{ #category : #accessing }
FamixVisitorCodeGenerator >> visitorClass: anObject [

	visitorTrait := anObject
]
