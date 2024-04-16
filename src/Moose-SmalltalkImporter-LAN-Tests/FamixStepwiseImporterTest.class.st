Class {
	#name : #FamixStepwiseImporterTest,
	#superclass : #TestCase,
	#classInstVars : [
		'aVariable'
	],
	#category : #'Moose-SmalltalkImporter-LAN-Tests'
}

{ #category : #accessing }
FamixStepwiseImporterTest >> defaultTimeLimit [
	^ 30 seconds
]

{ #category : #'instance creation' }
FamixStepwiseImporterTest >> newImportClassesTask [
	^ FamixStImportClassesTask new
		factory: FamixStModel factory;
		yourself
]

{ #category : #tests }
FamixStepwiseImporterTest >> testCheckFormalParameterIsCreated [

	| mseFormalParameter model |
	model := FamixStModel new.
	FamixStPharoImporterTask new
		importingContext: (MooseImportingContext new
				 importImplicitVariable;
				 importAccess;
				 mergeClassAndMetaclass;
				 yourself);
		doNotRunCandidateOperator;
		addClass: LANNode;
		model: model;
		run.
	mseFormalParameter := model entityNamed: #'Smalltalk::LANNode.nextNode:(Object).aNode'.
	self assert: mseFormalParameter name equals: #aNode
]

{ #category : #tests }
FamixStepwiseImporterTest >> testCheckSelfIsCreated [

	| model mseSelf |
	model := FamixStModel new.
	FamixStPharoImporterTask new
		importingContext: (MooseImportingContext new
				 importImplicitVariable;
				 importAccess;
				 mergeClassAndMetaclass;
				 yourself);
		doNotRunCandidateOperator;
		addClass: LANNode;
		model: model;
		run.
	mseSelf := model entityNamed: #'Smalltalk::LANNode.send:(Object).self'.
	self assert: mseSelf name equals: 'self' "mseMethod :=  model entityNamed:  #'Smalltalk::Node.send:(Object)'." "apparently I cannot access #'Smalltalk::Node.send:(Object).self'" "self assert: (mseMethod outgoingAccesses byName: 'Smalltalk::Node.self' ifAbsent: [] ) notEmpty."
]

{ #category : #tests }
FamixStepwiseImporterTest >> testImportAttribute [

	| importTask importer nodeClass |
	importTask := self newImportClassesTask.
	importTask importingContext: (MooseImportingContext new
			 importClass;
			 importAttribute;
			 importMethod;
			 importAccess;
			 mergeClassAndMetaclass;
			 yourself).
	importTask addClass: LANNode.
	importer := importTask run.
	nodeClass := importer classes at: LANNode.
	self assert: nodeClass attributes size equals: 2
]

{ #category : #tests }
FamixStepwiseImporterTest >> testImportAttributeAccesses [

	| importTask importer nodeClass attr |
	importTask := self newImportClassesTask.
	importTask importingContext: (MooseImportingContext new
			 importClass;
			 importAttribute;
			 importMethod;
			 importAccess;
			 mergeClassAndMetaclass;
			 yourself).
	importTask addClass: LANNode.
	importer := importTask run.
	nodeClass := importer classes at: LANNode.
	self assert: nodeClass attributes size equals: 2.
	attr := nodeClass attributes at: 1.
	self denyEmpty: attr readAccesses
]

{ #category : #tests }
FamixStepwiseImporterTest >> testImportClassAndAttributeAndMergeItsMetaclass [

	| importTask importer nodeClass |
	importTask := self newImportClassesTask.
	importTask importingContext: (MooseImportingContext new
			 importClass;
			 importAttribute;
			 mergeClassAndMetaclass;
			 yourself).
	importTask addClass: LANNode.
	importer := importTask run.
	nodeClass := importer classes at: LANNode.
	self assert: nodeClass attributes size equals: 2
]

{ #category : #tests }
FamixStepwiseImporterTest >> testImportClassAndInheritance [

	| importTask importer importedClasses |
	importTask := self newImportClassesTask.
	importTask importingContext: (MooseImportingContext new
			 importClass;
			 importInheritance;
			 mergeClassAndMetaclass;
			 yourself).
	importTask addClass: LANNode.
	importer := importTask run.
	importedClasses := importer classes.
	self assert: (importedClasses at: LANNode) directSubclasses size equals: 2.
	(importedClasses at: LANNode) directSubclasses do: [ :ech | self assert: (#( #LANOutputServer #LANWorkStation ) includes: ech name) ].
	self assert: (importedClasses at: LANNode) superclass name equals: #Model
]

{ #category : #tests }
FamixStepwiseImporterTest >> testImportClassAndMethodAndMergeItsMetaclass [

	| importTask importer importedMethods |
	importTask := self newImportClassesTask.
	importTask importingContext: (MooseImportingContext new
			 importClass;
			 importMethod;
			 mergeClassAndMetaclass;
			 yourself).
	importTask addClass: LANNode.
	importer := importTask run.
	importedMethods := importer methods values.
	self assert: importedMethods size equals: 13.
	self assert: (importedMethods first usesFamixTrait: FamixTMethod)
]

{ #category : #tests }
FamixStepwiseImporterTest >> testImportLANPackage [

	| model class package |
	model := FamixStModel new.
	FamixStPharoImporterTask new
		doNotRunCandidateOperator;
		importingContext: (MooseImportingContext new
				 importClass;
				 importPackage;
				 yourself);
		model: model;
		addFromPackageNamed: #'Moose-TestResources-LAN';
		run;
		yourself.
	self denyEmpty: model allPackages.
	package := model entityNamed: #'Moose-TestResources-LAN'.
	class := model entityNamed: #'Smalltalk::LANNode'.
	self assert: class parentPackage identicalTo: package
]

{ #category : #tests }
FamixStepwiseImporterTest >> testImportMergingMetaclassDoesNotDuplicateComment [

	| importTask importer comments |
	importTask := self newImportClassesTask.
	importTask importingContext: (MooseImportingContext new
			 importClass;
			 importComment;
			 mergeClassAndMetaclass;
			 yourself).
	importTask addClass: LANInterface.
	importer := importTask run.

	comments := importer allElements select: [ :e | e class = FamixStComment ].

	self assert: comments size equals: 1.
	self assert: comments anyOne commentedEntity equals: (importer classes at: LANInterface)
]

{ #category : #tests }
FamixStepwiseImporterTest >> testImportMethodBody [
	"Check if when importing the arguments of the LAN example, methods body are imported as well"

	"This is so since importing arguments implies an import of method body"

	| importTask importer context importedClasses famixClassNode nextNodeMethod nameMethod xFormalParameter |
	importTask := self newImportClassesTask.
	context := MooseImportingContext new
		           importArgument;
		           mergeClassAndMetaclass;
		           yourself.
	self assert: context shouldImportMethodBody.
	importTask importingContext: context.
	self assert: context shouldImportMethod.
	importTask addClass: LANNode.
	importer := importTask run.
	importedClasses := importer classes. "Imported classes are contained in a dictionary"
	self assert: importedClasses isDictionary. "Make sure that the node is present, this assertion is probably redundant with other tests"
	self assert: (importedClasses contains: [ :famixClass | famixClass name == #LANNode ]). "The class node is present, we can now get a reference on it"
	famixClassNode := importedClasses detect: [ :famixClass | famixClass name == #LANNode ]. "The number of methods of the imported class should be the same than the real class _and_ its metaclass (because of the mergeClassAndMetaclass)"
	self deny: famixClassNode methods size equals: LANNode methodDict size.
	self assert: famixClassNode methods size equals: LANNode methodDict size + LANNode class methodDict size. "Browser Node>>nextNode to see the code that has been imported"
	nextNodeMethod := famixClassNode methods detect: [ :fm | fm name == #nextNode ].
	self assertEmpty: nextNodeMethod parameters.
	self assert: nextNodeMethod signature identicalTo: #'nextNode()'.
	self assert: nextNodeMethod mooseName identicalTo: #'Smalltalk::LANNode.nextNode()'.
	nameMethod := famixClassNode methods detect: [ :fm | fm name == #name: ].
	self assert: nameMethod parameters size equals: 1.
	xFormalParameter := nameMethod parameters at: 1.
	self assert: xFormalParameter name equals: #aSymbol "self assert: (xFormalParameter isFormalParameter)." "The x formal parameter is the first (and only) argument in the method name:" "Its position is therefore 0" "self assert: (xFormalParameter position isZero)."
]

{ #category : #tests }
FamixStepwiseImporterTest >> testImportNamespace [

	| model nap |
	model := FamixStModel new.
	FamixStPharoImporterTask new
		doNotRunCandidateOperator;
		importingContext: (MooseImportingContext new
				 importNamespace;
				 importClass;
				 importPackage;
				 yourself);
		model: model;
		addFromPackageNamed: #'Moose-TestResources-LAN';
		run;
		yourself.
	nap := model entityNamed: #Smalltalk.
	self assert: (nap usesFamixTrait: FamixTNamespace)
]

{ #category : #tests }
FamixStepwiseImporterTest >> testImportOneClassAndItsMetaclass [

	| importTask importer importedClasses |
	importTask := self newImportClassesTask.
	importTask importingContext: MooseImportingContext new importClass.
	importTask addClass: LANNode.
	self assert: importTask classes size equals: 1.
	importer := importTask run.
	importedClasses := importer classes.
	self assert: importedClasses values size equals: 6.
	self assert: ((importedClasses at: LANNode) usesFamixTrait: FamixTClass)
]

{ #category : #tests }
FamixStepwiseImporterTest >> testImportOneClassAndMergeItsMetaclass [

	| importTask importer importedClasses |
	importTask := self newImportClassesTask.
	importTask importingContext: (MooseImportingContext new
			 importClass;
			 mergeClassAndMetaclass;
			 yourself).
	importTask addClass: LANNode.
	self assert: importTask classes size equals: 1.
	importer := importTask run.
	importedClasses := importer classes.
	self assert: importedClasses values asSet size equals: 3.
	self assert: ((importedClasses at: LANNode) usesFamixTrait: FamixTClass)
]

{ #category : #tests }
FamixStepwiseImporterTest >> testImportOneClassAndMethodAndMergeItsMetaclass [

	| importTask importer importedMethods |
	importTask := self newImportClassesTask.
	importTask importingContext: (MooseImportingContext new
			 importClass;
			 importMethod;
			 mergeClassAndMetaclass;
			 yourself).
	importTask addClass: LANNode.
	importer := importTask run.
	importedMethods := importer methods values.
	self assert: importedMethods size equals: 13.
	self assert: (importedMethods first usesFamixTrait: FamixTMethod)
]

{ #category : #tests }
FamixStepwiseImporterTest >> testImportOneClassAndOneAttributeAndMergeItsMetaclass [

	| importTask importer nodeClass |
	importTask := self newImportClassesTask.
	importTask importingContext: (MooseImportingContext new
			 importClass;
			 importAttribute;
			 mergeClassAndMetaclass;
			 yourself).
	importTask addClass: LANNode.
	importer := importTask run.
	nodeClass := importer classes at: LANNode.
	self assert: nodeClass attributes size equals: 2
]

{ #category : #tests }
FamixStepwiseImporterTest >> testImportWithoutMergingMetaclassDoesDuplicateComment [

	| importTask importer comments |
	importTask := self newImportClassesTask.
	importTask importingContext: (MooseImportingContext new
			 importClass;
			 importComment;
			 distinguishClassAndMetaclass;
			 yourself).
	importTask addClass: LANInterface.
	importer := importTask run.

	comments := importer allElements select: [ :e | e class = FamixStComment ].
	self assert: comments size equals: 2.
	self assertCollection: (comments collect: [ :comment | comment commentedEntity ]) hasSameElements: {
			(importer classes at: LANInterface).
			(importer classes at: LANInterface class) }
]
