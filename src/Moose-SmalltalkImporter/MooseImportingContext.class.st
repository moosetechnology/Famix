"
I represent the context of import (reification level) for an importer: been it a fact extractor (only for Smalltalk in this version of Moose), or an MSE or other format importing. 
The idea is that given a graph dependencies between metamodel entities, I help to decide whether certain information should be extracted or kept in a model.

For example, since to get inheritance, classes are needed (such dependency is expressed on my class side), then when we model inheritance, my instance encapsulate that fact extractor or importers should also consider classes. Similar dependencies exist between an access and a instance variable and a method. 

My main API is
	
	- importXXX to declare what we want.
		importClass
		importInheritance
	- shouldImportXXXX to query what we should do.
		shouldImportAccess
		shouldImportInheritance
	- mergeClassAndMetaclass, and other helper. 
 
My class side implements a semantically coherent graph of dependency.


"
Class {
	#name : #MooseImportingContext,
	#superclass : #Object,
	#instVars : [
		'entityKindsToBeExtracted',
		'mergeClassAndMetaclass',
		'importSubclasses',
		'computeAttributeTypes'
	],
	#classInstVars : [
		'entityDependencies'
	],
	#category : #'Moose-SmalltalkImporter'
}

{ #category : #initialize }
MooseImportingContext class >> defineEntityDependencies [

	<script>
	self entityDependencies
		at: self importingComment put: (Set with: self importingComment with: self importingMethod);
		at: self importingNamespace put: (Set with: self importingNamespace);
		at: self importingPackage put: (Set with: self importingPackage);
		at: self importingClass put: (Set with: self importingClass with: self importingNamespace);
		at: self importingInheritance put: (Set with: self importingClass with: self importingInheritance);
		at: self importingMethod put: (Set with: self importingMethod with: self importingClass);
		at: self importingClassExtension put: (Set with: self importingClassExtension with: self importingMethod with: self importingPackage);
		at: self importingImplicitVariable put: (Set with: self importingMethod with: self importingImplicitVariable);
		at: self importingLocalVariable put: (Set with: self importingMethod with: self importingLocalVariable);
		at: self importingAttribute put: (Set with: self importingAttribute with: self importingClass);
		at: self importingInvocation put: (Set with: self importingInvocation with: self importingMethod);
		at: self importingArgument put: (Set with: self importingMethod with: self importingArgument);
		at: self importingAccess put: (Set
				 with: self importingMethod
				 with: self importingImplicitVariable
				 with: self importingLocalVariable
				 with: self importingAccess
				 with: self importingArgument);
		at: self importingSmalltalkStubMethod put: (Set with: self importingMethod with: self importingSmalltalkStubMethod)
]

{ #category : #initialize }
MooseImportingContext class >> entityDependencies [
	
	^entityDependencies
]

{ #category : #initialize }
MooseImportingContext class >> entityDependencies: aDictionary [
	
	entityDependencies := aDictionary
]

{ #category : #'basic representation' }
MooseImportingContext class >> importingAccess [
	
	^#Access
]

{ #category : #'basic representation' }
MooseImportingContext class >> importingArgument [
	
	^#Argument
]

{ #category : #'basic representation' }
MooseImportingContext class >> importingAttribute [
	
	^#Attribute
]

{ #category : #'basic representation' }
MooseImportingContext class >> importingClass [
	
	^#Class
]

{ #category : #'basic representation' }
MooseImportingContext class >> importingClassExtension [
	
	^#ClassExtension
]

{ #category : #'basic representation' }
MooseImportingContext class >> importingComment [
	
	^#Comment
]

{ #category : #'basic representation' }
MooseImportingContext class >> importingImplicitVariable [
	
	^#ImplicitVariable
]

{ #category : #'basic representation' }
MooseImportingContext class >> importingInheritance [
	
	^#Inheritance
]

{ #category : #'basic representation' }
MooseImportingContext class >> importingInvocation [
	
	^#Invocation
]

{ #category : #'basic representation' }
MooseImportingContext class >> importingLocalVariable [
	
	^#LocalVariable
]

{ #category : #'basic representation' }
MooseImportingContext class >> importingMethod [
	
	^#Method
]

{ #category : #'basic representation' }
MooseImportingContext class >> importingNamespace [
	
	^#Namespace
]

{ #category : #'basic representation' }
MooseImportingContext class >> importingPackage [
	
	^#Package
]

{ #category : #'basic representation' }
MooseImportingContext class >> importingSmalltalkStubMethod [
	
	^#StubMethod
]

{ #category : #initialization }
MooseImportingContext class >> initialize [
	"self initialize"
	
	self entityDependencies: IdentityDictionary new.
	self defineEntityDependencies
]

{ #category : #accessing }
MooseImportingContext >> allDependentsOf: aKey [

	^ self allDependentsOf: aKey alreadyIn: Set new
]

{ #category : #accessing }
MooseImportingContext >> allDependentsOf: aKey alreadyIn: aSet [

	(self class entityDependencies at: aKey) do: [ :each |
		(aSet includes: each) ifFalse: [
			aSet add: each.
			aSet addAll: (self allDependentsOf: each alreadyIn: aSet) ] ].
	^ aSet
]

{ #category : #'import options' }
MooseImportingContext >> computeTypeOfAttributes [

	"use this method to tell the importer that it should compute the type of attributes (using RoelType). By default this not the case, because computing types can take some time "
	computeAttributeTypes := true.
]

{ #category : #'import options' }
MooseImportingContext >> distinguishClassAndMetaclass [
	
	mergeClassAndMetaclass := false
]

{ #category : #'import options' }
MooseImportingContext >> doNotComputeTypeOfAttributes [

	computeAttributeTypes := false.
]

{ #category : #'import options' }
MooseImportingContext >> doNotImportSubclasses [
	
	importSubclasses := false
]

{ #category : #accessing }
MooseImportingContext >> entityKindsToBeExtracted [
	
	^entityKindsToBeExtracted
]

{ #category : #accessing }
MooseImportingContext >> entityKindsToBeExtracted: anObject [
	
	entityKindsToBeExtracted := anObject
]

{ #category : #'importing-filters' }
MooseImportingContext >> importAccess [
	"in fact you check the dependents of the dependents"

	self entityKindsToBeExtracted addAll: (self allDependentsOf: self class importingAccess)
]

{ #category : #'importing-filters' }
MooseImportingContext >> importArgument [

	self entityKindsToBeExtracted addAll: (self allDependentsOf: self class importingArgument)
]

{ #category : #'importing-filters' }
MooseImportingContext >> importAttribute [
	"in fact you check the dependents of the dependents"

	self entityKindsToBeExtracted addAll: (self allDependentsOf: self class importingAttribute)
]

{ #category : #'importing-filters' }
MooseImportingContext >> importClass [
	"in fact you check the dependents of the dependents"

	self entityKindsToBeExtracted addAll: (self allDependentsOf: self class importingClass)
]

{ #category : #'importing-filters' }
MooseImportingContext >> importClassExtension [

	self entityKindsToBeExtracted addAll: (self allDependentsOf: self class importingClassExtension)
]

{ #category : #'importing-filters' }
MooseImportingContext >> importComment [
	"in fact you check the dependents of the dependents"

	self entityKindsToBeExtracted addAll: (self allDependentsOf: self class importingComment)
]

{ #category : #'importing-filters' }
MooseImportingContext >> importImplicitVariable [
	"in fact you check the dependents of the dependents"

	self entityKindsToBeExtracted addAll: (self allDependentsOf: self class importingImplicitVariable)
]

{ #category : #'importing-filters' }
MooseImportingContext >> importInheritance [
	"in fact you check the dependents of the dependents"

	self entityKindsToBeExtracted addAll: (self allDependentsOf: self class importingInheritance)
]

{ #category : #'importing-filters' }
MooseImportingContext >> importInvocation [
	"in fact you check the dependents of the dependents"

	self entityKindsToBeExtracted addAll: (self allDependentsOf: self class importingInvocation)
]

{ #category : #'importing-filters' }
MooseImportingContext >> importLocalVariable [
	"in fact you check the dependents of the dependents"

	self entityKindsToBeExtracted addAll: (self allDependentsOf: self class importingLocalVariable)
]

{ #category : #'importing-filters' }
MooseImportingContext >> importMaximum [
	
	self entityKindsToBeExtracted: self maximum
]

{ #category : #'importing-filters' }
MooseImportingContext >> importMethod [
	"in fact you check the dependents of the dependents"

	self entityKindsToBeExtracted addAll: (self allDependentsOf: self class importingMethod)
]

{ #category : #'importing-filters' }
MooseImportingContext >> importNamespace [
	"just import a package and nothing else"

	self entityKindsToBeExtracted addAll: (self allDependentsOf: self class importingNamespace)
]

{ #category : #'importing-filters' }
MooseImportingContext >> importPackage [
	"just import a package and nothing else"

	self entityKindsToBeExtracted addAll: (self allDependentsOf: self class importingPackage)
]

{ #category : #'importing-filters' }
MooseImportingContext >> importSmalltalkStubMethod [
	"Kind of a hack to import stub-methods in smalltalk"

	self entityKindsToBeExtracted addAll: (self allDependentsOf: self class importingSmalltalkStubMethod)
]

{ #category : #'import options' }
MooseImportingContext >> importSubclasses [
	"When a class is created, we automatically import all its subclasses"
	importSubclasses := true
]

{ #category : #initialization }
MooseImportingContext >> initialize [

	super initialize.
	self entityKindsToBeExtracted: Set new.
	mergeClassAndMetaclass := false.
	computeAttributeTypes := false.
	"for subclasses import for the moment we just do the same as before but it should be discussed and probably should be set to false"
	importSubclasses := true
]

{ #category : #'importing-filters' }
MooseImportingContext >> maximum [

	| all |
	all := Set new.
	self class entityDependencies keysAndValuesDo: [ :key :value | all addAll: value ].
	^ all
]

{ #category : #'import options' }
MooseImportingContext >> mergeClassAndMetaclass [
	
	mergeClassAndMetaclass := true
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldComputeTypeOfAttributes [
	"return true if the importer has to compute the type of attributes. False if not. "
	self flag: 'why does it not use #shouldImport: ?'.

	^ computeAttributeTypes
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldImport: aSymbol [
	
	^self entityKindsToBeExtracted includes: aSymbol
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldImportAccess [
	
	^self shouldImport: self class importingAccess
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldImportArgument [
	
	^self shouldImport: self class importingArgument
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldImportAttribute [
	
	^self shouldImport: self class importingAttribute
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldImportClass [
	
	^self shouldImport: self class importingClass
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldImportClassExtension [
	
	^self shouldImport: self class importingClassExtension
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldImportComment [
	
	^self shouldImport: self class importingComment
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldImportImplicitVariable [
	
	^self shouldImport: self class importingImplicitVariable
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldImportInheritance [
	
	^self shouldImport: self class importingInheritance
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldImportInvocation [
	
	^self shouldImport: self class importingInvocation
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldImportLocalVariable [
	
	^self shouldImport: self class importingLocalVariable
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldImportMethod [
	
	^self shouldImport: self class importingMethod
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldImportMethodBody [
	
	^self shouldImportAccess
		or:
			[self shouldImportImplicitVariable
				or:
					[self shouldImportLocalVariable
						or: [self shouldImportInvocation or: [self shouldImportArgument]]]]
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldImportNamespace [
	
	^self shouldImport: self class importingNamespace
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldImportPackage [
	
	^self shouldImport: self class importingPackage
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldImportSmalltalkStubMethod [
	
	^self shouldImport: self class importingSmalltalkStubMethod
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldImportSubclasses [
	self flag: 'why does it not use #shouldImport: ?'.

	^importSubclasses
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldMergeClassAndMetaclass [
	self flag: 'why does it not use #shouldImport: ?'.

	^mergeClassAndMetaclass
]
