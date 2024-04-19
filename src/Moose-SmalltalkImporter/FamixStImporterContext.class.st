"
I represent the context of import (reification level) for a smalltalk importer. 
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
	#name : #FamixStImporterContext,
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
FamixStImporterContext class >> defineEntityDependencies [

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
		at: self importingStubMethod put: (Set with: self importingMethod with: self importingStubMethod)
]

{ #category : #initialize }
FamixStImporterContext class >> entityDependencies [
	
	^entityDependencies
]

{ #category : #initialize }
FamixStImporterContext class >> entityDependencies: aDictionary [
	
	entityDependencies := aDictionary
]

{ #category : #'basic representation' }
FamixStImporterContext class >> importingAccess [
	
	^#Access
]

{ #category : #'basic representation' }
FamixStImporterContext class >> importingArgument [
	
	^#Argument
]

{ #category : #'basic representation' }
FamixStImporterContext class >> importingAttribute [
	
	^#Attribute
]

{ #category : #'basic representation' }
FamixStImporterContext class >> importingClass [
	
	^#Class
]

{ #category : #'basic representation' }
FamixStImporterContext class >> importingClassExtension [
	
	^#ClassExtension
]

{ #category : #'basic representation' }
FamixStImporterContext class >> importingComment [
	
	^#Comment
]

{ #category : #'basic representation' }
FamixStImporterContext class >> importingImplicitVariable [
	
	^#ImplicitVariable
]

{ #category : #'basic representation' }
FamixStImporterContext class >> importingInheritance [
	
	^#Inheritance
]

{ #category : #'basic representation' }
FamixStImporterContext class >> importingInvocation [
	
	^#Invocation
]

{ #category : #'basic representation' }
FamixStImporterContext class >> importingLocalVariable [
	
	^#LocalVariable
]

{ #category : #'basic representation' }
FamixStImporterContext class >> importingMethod [
	
	^#Method
]

{ #category : #'basic representation' }
FamixStImporterContext class >> importingNamespace [
	
	^#Namespace
]

{ #category : #'basic representation' }
FamixStImporterContext class >> importingPackage [
	
	^#Package
]

{ #category : #'basic representation' }
FamixStImporterContext class >> importingStubMethod [
	
	^#StubMethod
]

{ #category : #initialization }
FamixStImporterContext class >> initialize [
	"self initialize"
	
	self entityDependencies: IdentityDictionary new.
	self defineEntityDependencies
]

{ #category : #accessing }
FamixStImporterContext >> allDependentsOf: aKey [

	^ self allDependentsOf: aKey alreadyIn: Set new
]

{ #category : #accessing }
FamixStImporterContext >> allDependentsOf: aKey alreadyIn: aSet [

	(self class entityDependencies at: aKey) do: [ :each |
		(aSet includes: each) ifFalse: [
			aSet add: each.
			aSet addAll: (self allDependentsOf: each alreadyIn: aSet) ] ].
	^ aSet
]

{ #category : #'import options' }
FamixStImporterContext >> computeTypeOfAttributes [

	"use this method to tell the importer that it should compute the type of attributes (using RoelType). By default this not the case, because computing types can take some time "
	computeAttributeTypes := true.
]

{ #category : #'import options' }
FamixStImporterContext >> distinguishClassAndMetaclass [
	
	mergeClassAndMetaclass := false
]

{ #category : #'import options' }
FamixStImporterContext >> doNotComputeTypeOfAttributes [

	computeAttributeTypes := false.
]

{ #category : #'import options' }
FamixStImporterContext >> doNotImportSubclasses [
	
	importSubclasses := false
]

{ #category : #accessing }
FamixStImporterContext >> entityKindsToBeExtracted [
	
	^entityKindsToBeExtracted
]

{ #category : #accessing }
FamixStImporterContext >> entityKindsToBeExtracted: anObject [
	
	entityKindsToBeExtracted := anObject
]

{ #category : #'importing-filters' }
FamixStImporterContext >> importAccess [
	"in fact you check the dependents of the dependents"

	self entityKindsToBeExtracted addAll: (self allDependentsOf: self class importingAccess)
]

{ #category : #'importing-filters' }
FamixStImporterContext >> importArgument [

	self entityKindsToBeExtracted addAll: (self allDependentsOf: self class importingArgument)
]

{ #category : #'importing-filters' }
FamixStImporterContext >> importAttribute [
	"in fact you check the dependents of the dependents"

	self entityKindsToBeExtracted addAll: (self allDependentsOf: self class importingAttribute)
]

{ #category : #'importing-filters' }
FamixStImporterContext >> importClass [
	"in fact you check the dependents of the dependents"

	self entityKindsToBeExtracted addAll: (self allDependentsOf: self class importingClass)
]

{ #category : #'importing-filters' }
FamixStImporterContext >> importClassExtension [

	self entityKindsToBeExtracted addAll: (self allDependentsOf: self class importingClassExtension)
]

{ #category : #'importing-filters' }
FamixStImporterContext >> importComment [
	"in fact you check the dependents of the dependents"

	self entityKindsToBeExtracted addAll: (self allDependentsOf: self class importingComment)
]

{ #category : #'importing-filters' }
FamixStImporterContext >> importImplicitVariable [
	"in fact you check the dependents of the dependents"

	self entityKindsToBeExtracted addAll: (self allDependentsOf: self class importingImplicitVariable)
]

{ #category : #'importing-filters' }
FamixStImporterContext >> importInheritance [
	"in fact you check the dependents of the dependents"

	self entityKindsToBeExtracted addAll: (self allDependentsOf: self class importingInheritance)
]

{ #category : #'importing-filters' }
FamixStImporterContext >> importInvocation [
	"in fact you check the dependents of the dependents"

	self entityKindsToBeExtracted addAll: (self allDependentsOf: self class importingInvocation)
]

{ #category : #'importing-filters' }
FamixStImporterContext >> importLocalVariable [
	"in fact you check the dependents of the dependents"

	self entityKindsToBeExtracted addAll: (self allDependentsOf: self class importingLocalVariable)
]

{ #category : #'importing-filters' }
FamixStImporterContext >> importMaximum [
	
	self entityKindsToBeExtracted: self maximum
]

{ #category : #'importing-filters' }
FamixStImporterContext >> importMethod [
	"in fact you check the dependents of the dependents"

	self entityKindsToBeExtracted addAll: (self allDependentsOf: self class importingMethod)
]

{ #category : #'importing-filters' }
FamixStImporterContext >> importNamespace [
	"just import a package and nothing else"

	self entityKindsToBeExtracted addAll: (self allDependentsOf: self class importingNamespace)
]

{ #category : #'importing-filters' }
FamixStImporterContext >> importPackage [
	"just import a package and nothing else"

	self entityKindsToBeExtracted addAll: (self allDependentsOf: self class importingPackage)
]

{ #category : #'importing-filters' }
FamixStImporterContext >> importStubMethod [
	"Kind of a hack to import stub-methods in smalltalk"

	self entityKindsToBeExtracted addAll: (self allDependentsOf: self class importingStubMethod)
]

{ #category : #'import options' }
FamixStImporterContext >> importSubclasses [
	"When a class is created, we automatically import all its subclasses"
	importSubclasses := true
]

{ #category : #initialization }
FamixStImporterContext >> initialize [

	super initialize.
	self entityKindsToBeExtracted: Set new.
	mergeClassAndMetaclass := false.
	computeAttributeTypes := false.
	"for subclasses import for the moment we just do the same as before but it should be discussed and probably should be set to false"
	importSubclasses := true
]

{ #category : #'importing-filters' }
FamixStImporterContext >> maximum [

	| all |
	all := Set new.
	self class entityDependencies keysAndValuesDo: [ :key :value | all addAll: value ].
	^ all
]

{ #category : #'import options' }
FamixStImporterContext >> mergeClassAndMetaclass [
	
	mergeClassAndMetaclass := true
]

{ #category : #'importing queries' }
FamixStImporterContext >> shouldComputeTypeOfAttributes [
	"return true if the importer has to compute the type of attributes. False if not. "
	self flag: 'why does it not use #shouldImport: ?'.

	^ computeAttributeTypes
]

{ #category : #'importing queries' }
FamixStImporterContext >> shouldImport: aSymbol [
	
	^self entityKindsToBeExtracted includes: aSymbol
]

{ #category : #'importing queries' }
FamixStImporterContext >> shouldImportAccess [
	
	^self shouldImport: self class importingAccess
]

{ #category : #'importing queries' }
FamixStImporterContext >> shouldImportArgument [
	
	^self shouldImport: self class importingArgument
]

{ #category : #'importing queries' }
FamixStImporterContext >> shouldImportAttribute [
	
	^self shouldImport: self class importingAttribute
]

{ #category : #'importing queries' }
FamixStImporterContext >> shouldImportClass [
	
	^self shouldImport: self class importingClass
]

{ #category : #'importing queries' }
FamixStImporterContext >> shouldImportClassExtension [
	
	^self shouldImport: self class importingClassExtension
]

{ #category : #'importing queries' }
FamixStImporterContext >> shouldImportComment [
	
	^self shouldImport: self class importingComment
]

{ #category : #'importing queries' }
FamixStImporterContext >> shouldImportImplicitVariable [
	
	^self shouldImport: self class importingImplicitVariable
]

{ #category : #'importing queries' }
FamixStImporterContext >> shouldImportInheritance [
	
	^self shouldImport: self class importingInheritance
]

{ #category : #'importing queries' }
FamixStImporterContext >> shouldImportInvocation [
	
	^self shouldImport: self class importingInvocation
]

{ #category : #'importing queries' }
FamixStImporterContext >> shouldImportLocalVariable [
	
	^self shouldImport: self class importingLocalVariable
]

{ #category : #'importing queries' }
FamixStImporterContext >> shouldImportMethod [
	
	^self shouldImport: self class importingMethod
]

{ #category : #'importing queries' }
FamixStImporterContext >> shouldImportMethodBody [
	
	^self shouldImportAccess
		or:
			[self shouldImportImplicitVariable
				or:
					[self shouldImportLocalVariable
						or: [self shouldImportInvocation or: [self shouldImportArgument]]]]
]

{ #category : #'importing queries' }
FamixStImporterContext >> shouldImportNamespace [
	
	^self shouldImport: self class importingNamespace
]

{ #category : #'importing queries' }
FamixStImporterContext >> shouldImportPackage [
	
	^self shouldImport: self class importingPackage
]

{ #category : #'importing queries' }
FamixStImporterContext >> shouldImportSmalltalkStubMethod [
	
	^self shouldImport: self class importingStubMethod
]

{ #category : #'importing queries' }
FamixStImporterContext >> shouldImportSubclasses [
	self flag: 'why does it not use #shouldImport: ?'.

	^importSubclasses
]

{ #category : #'importing queries' }
FamixStImporterContext >> shouldMergeClassAndMetaclass [
	self flag: 'why does it not use #shouldImport: ?'.

	^mergeClassAndMetaclass
]
