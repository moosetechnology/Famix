Class {
	#name : #FamixReferenceModelImporterTest,
	#superclass : #TestCase,
	#instVars : [
		'referenceModelTheRootName',
		'referenceModelSubRootLevelOneName'
	],
	#category : #'Moose-SmalltalkImporter-Core-Tests'
}

{ #category : #resources }
FamixReferenceModelImporterTest class >> resources [
	^ Array with: FamixReferenceModelNamespaceTestResource
]

{ #category : #private }
FamixReferenceModelImporterTest >> model [
	^self class resources first current model
]

{ #category : #'reference model access' }
FamixReferenceModelImporterTest >> privateTestAccessingVar: aVarName from: aMethodName shouldBeRead: aBoolean hasAccessesSize: anInteger [

	| methodName var access |
	methodName := self model allMethods entityNamed: aMethodName.
	var := (self model allUsing: FamixTAccessible) entityNamed: aVarName.
	self
		assert:
			(var incomingAccesses select: [ :each | each accessor = methodName ])
				size
		equals: anInteger.
	access := (var incomingAccesses select: [ :each |
		           each accessor = methodName ]) first.
	self assert: access isRead equals: aBoolean.
	self deny: access isWrite equals: aBoolean
]

{ #category : #running }
FamixReferenceModelImporterTest >> setUp [

	super setUp.
	referenceModelSubRootLevelOneName := SubRootLevelOne mooseName.
	referenceModelTheRootName := TheRoot mooseName
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testAbstractMethodAnnotation [

	| definingClassName method methodName fmClass |
	definingClassName := TheRoot mooseName.
	methodName := (TheRoot >> #sendingSubclassResponsibility) mooseName.
	method := self model entityNamed: methodName.
	self assert: method isNotNil.
	self
		assert: method belongsTo
		equals: (self model entityNamed: TheRoot mooseName).
	self deny: method isClassSide.
	self
		assert: method signature
		equals:
			(FamixSmalltalkNameResolver signatureFromSmalltalkSelectorOn:
				 #sendingSubclassResponsibility).
	self assert: method isAbstract.
	fmClass := self model entityNamed: definingClassName.
	self assert: fmClass isAbstract
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testAccessReadOnly [
	self
		privateTestAccessingVar: #'Smalltalk.TheRoot.x'
		from: #'Smalltalk.TheRoot.x()'
		shouldBeRead: true
		hasAccessesSize: 1
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testAccessSharedVariableFromTheClassSide [
	| classVarUniqueName accessDefinition methodUniqueName |
	methodUniqueName := (TheRoot class >> #accessSharedVariableFromTheClassSide) mooseName.
	classVarUniqueName := TheRoot @ #TheRootSharedVariable.
	accessDefinition := self model allAccesses select: [ :acc | acc variable mooseName = classVarUniqueName and: [ acc accessor mooseName = methodUniqueName ] ].
	self assert: accessDefinition size equals: 1.
	self assert: (accessDefinition at: 1) isWrite
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testAccessSharedVariableFromTheInstanceSide [
	| accessDefinition |
	accessDefinition := self model allAccesses
		select: [ :acc | 
			acc variable mooseName = 'Smalltalk.TheRoot.TheRootSharedVariable'
				and: [ acc accessor mooseName = (TheRoot >> #accessSharedVariableFromTheInstanceSide) mooseName ] ].
	self assert: accessDefinition size equals: 1.
	self assert: (accessDefinition at: 1) isWrite
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testAccessSharedVariableOfSuperclassClassSide [
	| instVarUniqueName accessDefinition methodUniqueName |
	methodUniqueName := (SubRootLevelOne class >> #accessSharedVariableOfSuperClassClassSide) mooseName.
	instVarUniqueName := TheRoot @ #TheRootSharedVariable.
	accessDefinition := self model allAccesses select: [ :acc | acc variable mooseName = instVarUniqueName and: [ acc accessor mooseName = methodUniqueName ] ].
	self assert: accessDefinition size equals: 1.
	self assert: (accessDefinition at: 1) isWrite
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testAccessSharedVariableOfSuperclassClassSide2 [

	| instVarUniqueName accessDefinition methodUniqueName |
	"we test OtherRootFromClass class>>accessSharedVariableOfSuperSuperClassClassSide6"
	methodUniqueName := (OtherRootFromClass class >> #accessSharedVariableOfSuperSuperClassClassSide) mooseName.
	instVarUniqueName := Behavior @ #ClassProperties.
	accessDefinition := self model allAccesses select: [ :acc | acc variable mooseName = instVarUniqueName and: [ acc accessor mooseName = methodUniqueName ] ].
	self assert: accessDefinition size equals: 1.
	self assert: (accessDefinition at: 1) isWrite
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testAccessSharedVariableOfSuperclassInstanceSide [
	|  accessDefinition |
	accessDefinition := self model allAccesses
		select: [ :acc | 
			acc variable mooseName = 'Smalltalk.TheRoot.TheRootSharedVariable'
				and: [ acc accessor mooseName = (SubRootLevelOne >> #accessSharedVariableOfSuperclassInstanceSide) mooseName ] ].
	self assert: accessDefinition size equals: 1.
	self assert: (accessDefinition at: 1) isWrite
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testAccessWriteOnly [
	self
		privateTestAccessingVar: #'Smalltalk.TheRoot.x'
		from: #'Smalltalk.TheRoot.x:(Object)'
		shouldBeRead: false
		hasAccessesSize: 1
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testAccessingFormalParameter [
	self
		privateTestAccessingVar: #'Smalltalk.TheRoot.accessingArgument:(Object).anArgument'
		from: #'Smalltalk.TheRoot.accessingArgument:(Object)'
		shouldBeRead: true
		hasAccessesSize: 1
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testAccessingGlobalVariableFromInstanceSide [
	| declaredType |
	self
		privateTestAccessingVar: #Transcript
		from: #'Smalltalk.TheRoot.accessingGlobalVariableFromInstanceSide()'
		shouldBeRead: true
		hasAccessesSize: 1.
	declaredType := (self model allGlobalVariables entityNamed: #Transcript) declaredType.
	self assert: declaredType mooseName equals: Transcript class mooseName.
	self assert: (declaredType usesFamixTrait: FamixTType)
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testAccessingGlobalVariableHavingNamespaceNameFromInstanceSide [
	| accessDefinition methodUniqueName |
	methodUniqueName := (TheRoot >> #accessingGlobalVariableHavingNamespaceName) mooseName.
	accessDefinition := (self model entityNamed: methodUniqueName) accesses select: [ :acc | acc target mooseName = #SmalltalkGlobalVariable ].
	self assert: accessDefinition size equals: 1
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testAccessingImportedClassWithinReturnVariable [
	| method var accesses |
	method := self model entityNamed: #'Smalltalk.TheRoot.returningImportedClass()'.
	var := self model entityNamed: #'Smalltalk.TheRoot'.
	accesses := self model allReferences select: [ :each | each source = method and: [ each target = var ] ].
	self assert: accesses size equals: 1
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testAccessingLocalVariable [
	self
		privateTestAccessingVar: #'Smalltalk.TheRoot.assigningLocalVariable().tmp'
		from: #'Smalltalk.TheRoot.assigningLocalVariable()'
		shouldBeRead: false
		hasAccessesSize: 1
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testAccessingNamespace2 [
	| accessDefinition |
	accessDefinition := (self model entityNamed: 'Smalltalk.TheRoot.accessingGlobalVariableHavingNamespaceName()') accesses
		select: [ :acc | acc target mooseName = #SmalltalkGlobalVariable ].
	self assert: accessDefinition size equals: 1
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testAccessingNamespaceAsGlobalVariable [
	| accessDefinition method globalVariable |
	"TheRoot>>accessingNamespace
		Smalltalk"
	globalVariable := self model entityNamed: #SmalltalkGlobalVariable.
	method := self model entityNamed: (TheRoot >> #accessingNamespace) mooseName.	"since we have two methods accessing to Smalltalk 
	we have two accesses"
	self assert: (self model allAccesses select: [ :acc | acc target name = #SmalltalkGlobalVariable ]) size equals: 2.
	self assert: (self model allAccesses select: [ :ref | ref target = globalVariable ]) size equals: 2.
	accessDefinition := self model allAccesses select: [ :ref | ref target = globalVariable and: [ ref source == method ] ].
	self assert: accessDefinition size equals: 1
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testAccessingStubClassWithinReturnVariable [
	| accessDefinition methodUniqueName classUniqueName |
	classUniqueName := String mooseName.
	methodUniqueName := (TheRoot >> #returningStubClass) mooseName.
	accessDefinition := self model allReferences select: [ :acc | acc target mooseName = classUniqueName and: [ acc source mooseName = methodUniqueName ] ].
	self assert: accessDefinition size equals: 1
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testAnnotationInstanceAttributes [
	| unaryAnnType withParameterAnnType |
	unaryAnnType := self model allAnnotationTypes detect: [ :each | each name = #aPragma ].
	self assertEmpty: unaryAnnType instances first attributes.
	withParameterAnnType := self model allAnnotationTypes detect: [ :each | each name = #aPragma:parameter: ].
	self assert: withParameterAnnType instances first attributes size equals: 2.
	self assert: withParameterAnnType instances last attributes size equals: 2.
	self assert: withParameterAnnType instances first attributes first annotationTypeAttribute name equals: #aPragma.
	self assert: withParameterAnnType instances first attributes last annotationTypeAttribute name equals: #parameter
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testAnnotationInstanceAttributesInModel [
	self model allAnnotationInstances do: [:each | 
		each attributes do: [:attr | 
			self assert: attr mooseModel equals: self model ]]
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testAnnotationInstances [
	| unaryAnnType withParameterAnnType |
	self assert: self model allAnnotationInstances size equals: 4.
	unaryAnnType := self model allAnnotationTypes detect: [ :each | each name = #aPragma ].
	withParameterAnnType := self model allAnnotationTypes detect: [ :each | each name = #aPragma:parameter: ].
	self assert: unaryAnnType instances size equals: 1.
	self assert: withParameterAnnType instances size equals: 2
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testAnnotationInstancesConnectedToMethods [
	| method |
	method := self model allMethods entityNamed: (TheRoot >> #pragmaWithUnaryName) mooseName.
	self assert: method annotationInstances size equals: 1.
	self assert: method annotationInstances first annotatedEntity equals: method.
	method := self model allMethods entityNamed: (TheRoot >> #pragmaWithParameters) mooseName.
	self assert: method annotationInstances size equals: 1.
	self assert: method annotationInstances first annotatedEntity equals: method.
	method := self model allMethods entityNamed: (TheRoot >> #multiplePragmas) mooseName.
	self assert: method annotationInstances size equals: 2.
	self assert: method annotationInstances first annotatedEntity equals: method.
	self assert: method annotationInstances last annotatedEntity equals: method
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testAnnotationTypeAttributes [
	| unaryAnnType withParameterAnnType |
	unaryAnnType := self model allAnnotationTypes detect: [ :each | each name = #aPragma ].
	self assertEmpty: unaryAnnType attributes.
	withParameterAnnType := self model allAnnotationTypes detect: [ :each | each name = #aPragma:parameter: ].
	self assert: withParameterAnnType attributes size equals: 2
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testAnnotationTypeAttributesInModel [
	self model allAnnotationTypes do: [:each | 
		each attributes do: [:attr | 
			self assert: attr mooseModel equals: self model ]]
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testAnnotationTypes [
	self assert: self model allAnnotationTypes size equals: 3.
	self assert: (self model allAnnotationTypes anySatisfy: [ :each | each name = #aPragma ]).
	self assert: (self model allAnnotationTypes anySatisfy: [ :each | each name = #anotherPragma ]).
	self assert: (self model allAnnotationTypes anySatisfy: [ :each | each name = #aPragma:parameter: ])
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testClassAnnotation [
	| definingClassName famixClass |
	definingClassName := #'Smalltalk.SubRootLevelOne' mooseName.
	famixClass := self model entityNamed: definingClassName.
	self assert: famixClass parentPackage name equals: #'Moose-TestResources-Reference-Core'
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testClassClassAnnotation [
	"Should work for metaclasse too"

	| definingClassName famixClass |
	definingClassName := SubRootLevelOne class mooseName.
	famixClass := self model entityNamed: definingClassName.
	self assert: famixClass parentPackage name equals: #'Moose-TestResources-Reference-Core'
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testClassMetaclassInstanceVariableAndShared [
	| insVar theRoot insMetaclassVar shared theRootMeta |
	insVar := self model entityNamed: #'Smalltalk.TheRoot.z'.
	insMetaclassVar := self model entityNamed: #'Smalltalk.TheRoot_class.mz'.
	shared := self model entityNamed: #'Smalltalk.TheRoot.TheRootSharedVariable'.
	theRoot := self model entityNamed: #'Smalltalk.TheRoot'.
	theRootMeta := self model entityNamed: #'Smalltalk.TheRoot_class'.
	self deny: insVar isClassSide.
	self assert: insMetaclassVar isClassSide.
	self assert: shared isClassSide.
	self assert: insVar belongsTo equals: theRoot.
	self assert: insMetaclassVar belongsTo equals: theRootMeta.
	self assert: shared belongsTo equals: theRoot.
	self assert: shared isSharedVariable.
	self deny: insVar isSharedVariable.
	self deny: insMetaclassVar isSharedVariable
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testClassMethodAnnotation [
	| method |
	method := self model entityNamed: 'Smalltalk.SubRootLevelOne_class.accessSharedVariableOfSuperClassClassSide()'.
	self assert: method protocol equals: #'accessing superclassinstance on class side'
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testClassReferenceFromTheInstanceSide [
	"TheRoot>>accessingClass

		Object new"

	| methodName className refs |
	className := Object mooseName.
	methodName := (TheRoot >> #accessingClass) mooseName.
	refs := self model allReferences select: [ :acc | acc source mooseName = methodName and: [ acc target mooseName = className ] ].
	self assert: refs size equals: 1
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testClassReferencesByFullNameReified [
	self assert: (self model entityNamed: TestCase class mooseName) isNotNil
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testClassSelfSend [
	| invocations calleeMethodName callingMethodUniqueName |
	"We want to represent
	TheRoot class>>classSend

			Object new
	"
	calleeMethodName := #new mooseName.
	callingMethodUniqueName := (TheRoot class >> #classSend) mooseName.
	invocations := self model allInvocations
		select: [ :invocation | 
			invocation signature = (FamixSmalltalkNameResolver signatureFromSmalltalkSelectorOn: calleeMethodName)
				and: [ invocation sender mooseName = callingMethodUniqueName ] ].
	self assert: invocations size equals: 1.
	self assert: invocations first receiver mooseName equals: #'Smalltalk.Object_class'
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testConflictingInstanceVarNames [
	| insVar theRoot insMetaclassVar shared theRootMeta |
	insVar := self model entityNamed: #'Smalltalk.TheRoot.instanceAndClassPotentiallyConflictingName'.
	insMetaclassVar := self model entityNamed: #'Smalltalk.TheRoot_class.instanceAndClassPotentiallyConflictingName'.
	shared := self model entityNamed: #'Smalltalk.TheRoot.TheRootSharedVariable'.
	theRoot := self model entityNamed: #'Smalltalk.TheRoot'.
	theRootMeta := self model entityNamed: #'Smalltalk.TheRoot_class'.
	self deny: insVar isClassSide.
	self assert: insMetaclassVar isClassSide.
	self assert: shared isClassSide.
	self assert: insVar belongsTo equals: theRoot.
	self assert: insMetaclassVar belongsTo equals: theRootMeta.
	self assert: shared belongsTo equals: theRoot
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testConstantMethodAnnotation [
	| methodUniqueName method |
	methodUniqueName := (TheRoot >> #constantReturningMethod) mooseName.
	method := self model entityNamed: methodUniqueName.
	self assert: method isNotNil.
	self assert: method belongsTo equals: (self model entityNamed: TheRoot mooseName).
	self deny: method isClassSide.
	self assert: method signature equals: (FamixSmalltalkNameResolver signatureFromSmalltalkSelectorOn: #constantReturningMethod).
	self assert: method isConstant
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testDisplayFullString [
	"Smoke test for #displayFullString"

	self shouldnt: [ self model entities do: [ :entity | entity displayFullString ] ] raise: Error.

	self assertEmpty: ((self model entities select: [ :entity | entity isAssociation ]) select: [ :asso | asso displayFullString = #noname ])
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testExtendedClasses [
	| subRootModelTwo p1 p2 subRootModelThree extensionMethod |
	p1 := self model entityNamed: #'Moose-TestResources-Reference-PackageOne'.
	p2 := self model entityNamed: #'Moose-TestResources-Reference-PackageTwo'.
	subRootModelTwo := self model entityNamed: SubRootModelTwo mooseName.
	subRootModelThree := self model entityNamed: SubRootModelThree mooseName.
	extensionMethod := self model entityNamed: (SubRootModelTwo >> #extendedMethodOne) mooseName.
	self assertCollection: (subRootModelTwo atScope: FamixTPackage) hasSameElements: {p1}.
	self assert: subRootModelTwo isExtended.
	self assert: (subRootModelTwo extendedInPackages includes: p2).
	self assert: (subRootModelTwo extendedMethods includes: extensionMethod).
	self deny: subRootModelThree isExtended
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testExtendedPackage [
	| extendedClass extendedPackage |
	extendedPackage := self model entityNamed: #'Moose-TestResources-Reference-PackageOne'.
	extendedClass := self model entityNamed: SubRootModelTwo mooseName.
	self assert: (extendedPackage localClasses includes: extendedClass).
	self assert: (extendedPackage extendedClasses includes: extendedClass).
	self assertEmpty: extendedPackage extensionClasses.
	self assert: extendedPackage methods size equals: 2.
	self assert: extendedPackage localMethods size equals: 2
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testExtensionClasses [
	| p1 p2 extensionClasses c3 c2 |
	p1 := self model entityNamed: #'Moose-TestResources-Reference-PackageOne'.
	p2 := self model entityNamed: #'Moose-TestResources-Reference-PackageTwo'.
	extensionClasses := p2 extensionClasses.
	c3 := self model entityNamed: SubRootModelThree mooseName.
	c2 := self model entityNamed: SubRootModelTwo mooseName.
	self assert: (p2 localClasses includes: c3).
	self assert: (p1 localClasses includes: c2).
	self assert: p1 localClasses size equals: 2.	"class and metaclass"
	self deny: (extensionClasses includes: c3).
	self assert: (extensionClasses includes: c2)
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testExtensionMethod [
	| p2 extensionMethod |
	p2 := self model entityNamed: #'Moose-TestResources-Reference-PackageTwo'.
	extensionMethod := self model entityNamed: (SubRootModelTwo >> #extendedMethodOne) mooseName.
	self assert: extensionMethod isExtension.
	self assert: ((extensionMethod atScope: FamixTPackage) includes: p2).
	self assert: (extensionMethod atScope: FamixTPackage) ~~ (extensionMethod belongsTo atScope: FamixTPackage)
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testExtensionPackage [
	| normalClass extendedClass extensionPackage externalExtendedClass |
	extensionPackage := self model allPackages entityNamed: #'Moose-TestResources-Reference-PackageTwo'.
	extendedClass := self model entityNamed: SubRootModelTwo mooseName.
	externalExtendedClass := self model entityNamed: ExternalReferenceClass mooseName.
	normalClass := self model entityNamed: SubRootModelThree mooseName.
	self assert: (extensionPackage classes includes: normalClass).
	self deny: (extensionPackage classes includes: extendedClass).
	self deny: (extensionPackage classes includes: externalExtendedClass).
	self assert: (extensionPackage localClasses includes: normalClass).
	self deny: (extensionPackage extensionClasses includes: normalClass).
	self assert: (extensionPackage extensionClasses includes: extendedClass).
	self assert: (extensionPackage extensionClasses includes: externalExtendedClass).
	self assertEmpty: extensionPackage extendedClasses.
	self assert: extensionPackage methods size equals: 3.
	self assert: extensionPackage localMethods size equals: 1.
	self assert: extensionPackage extensionMethods size equals: 2.
	self assert: (extensionPackage extensionMethods includes: (self model entityNamed: (ExternalReferenceClass >> #externalClassExtensionForTest) mooseName)).
	self assert: (extensionPackage extensionMethods includes: (self model entityNamed: (SubRootModelTwo >> #extendedMethodOne) mooseName))
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testExtensions [
	| normalClass extendedClass |
	extendedClass := self model entityNamed: SubRootModelTwo mooseName.
	normalClass := self model entityNamed: SubRootModelThree mooseName.
	self assert: extendedClass isExtended.
	self assert: (extendedClass atScope: FamixTPackage) anyOne name equals: #'Moose-TestResources-Reference-PackageOne'.
	self assert: (extendedClass methods flatCollect: [ :m | m atScope: FamixTPackage ]) asSet size equals: 2.
	self assert: ((extendedClass methods flatCollect: [ :m | m atScope: FamixTPackage ]) asSet anySatisfy: [ :each | each name = #'Moose-TestResources-Reference-PackageOne' ]).
	self assert: ((extendedClass methods flatCollect: [ :m | m atScope: FamixTPackage ]) asSet anySatisfy: [ :each | each name = #'Moose-TestResources-Reference-PackageTwo' ]).
	self deny: normalClass isExtended.
	self assert: (normalClass atScope: FamixTPackage) anyOne name equals: #'Moose-TestResources-Reference-PackageTwo'.
	self assert: (normalClass methods flatCollect: [ :m | m atScope: FamixTPackage ]) asSet size equals: 1.
	self assert: ((normalClass methods flatCollect: [ :m | m atScope: FamixTPackage ]) allSatisfy: [ :each | each name = #'Moose-TestResources-Reference-PackageTwo' ])
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testExternalExtension [
	| extensionPackage externalExtendedClass |
	extensionPackage := self model entityNamed: #'Moose-TestResources-Reference-PackageTwo'.
	externalExtendedClass := self model entityNamed: ExternalReferenceClass mooseName.

	self assert: externalExtendedClass isStub.
	self deny: (extensionPackage classes includes: externalExtendedClass).
	self assert: (extensionPackage extensionMethods includes: (self model entityNamed: (ExternalReferenceClass >> #externalClassExtensionForTest) mooseName))
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testFormalParameterReified [
	| formalParameterName |
	formalParameterName := #'Smalltalk.TheRoot.accessingArgument:(Object).anArgument'.
	self assert: (self model entityNamed: formalParameterName) isNotNil
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testGetterMethod [
	| methodUniqueName method |
	methodUniqueName := (TheRoot >> #x) mooseName.
	method := self model entityNamed: methodUniqueName.
	self assert: method isNotNil.
	self deny: method isClassSide.
	self assert: method signature equals: (FamixSmalltalkNameResolver signatureFromSmalltalkSelectorOn: #x).
	self assert: method isPureAccessor.
	self assert: method isGetter
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testGlobalVariableReified [
	| globalVariable |
	globalVariable := self model entityNamed: #Transcript.
	self assert: globalVariable isNotNil
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testImplicitVariableReified [
	self assert: (self model entityNamed: 'Smalltalk.TheRoot.singleSelfSend().self') isNotNil
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testInstVariableAccessInDefiningClass [
	self
		privateTestAccessingVar: #'Smalltalk.SubRootLevelOne.k'
		from: #'Smalltalk.SubRootLevelOne.accessSuperclassInstVar()'
		shouldBeRead: false
		hasAccessesSize: 1
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testInstVariableAccessInDefiningMetaclass [
	self
		privateTestAccessingVar: #'Smalltalk.TheRoot_class.mx'
		from: #'Smalltalk.TheRoot_class.accessInstanceVariable()'
		shouldBeRead: false
		hasAccessesSize: 1
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testInstVariableAccessInSuperClass [
	self
		privateTestAccessingVar: (TheRoot mooseNameOf: #x)
		from: #'Smalltalk.SubRootLevelOne.accessSuperclassInstVar()'
		shouldBeRead: true
		hasAccessesSize: 1.

	self
		privateTestAccessingVar: (TheRoot mooseNameOf: #y)
		from: (SubRootLevelOne >> #accessSuperclassInstVar) mooseName
		shouldBeRead: true
		hasAccessesSize: 1
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testInstVariableAccessTwiceTheSameVariable [
	self
		privateTestAccessingVar: SubRootLevelOne @ #k
		from: (SubRootLevelOne >> #accessTwiceTheSameVariable) mooseName
		shouldBeRead: true
		hasAccessesSize: 2
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testInstanceVariableReified [
	| instVar |
	instVar := self model entityNamed: 'Smalltalk.SubRootLevelOne.k'.
	self deny: instVar isClassSide
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testLocalVariableReified [
	self assert: (self model entityNamed: 'Smalltalk.TheRoot.assigningLocalVariable().tmp') isNotNil
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testMetaclassAttributeIsClassSide [
	| attribute theRoot |
	attribute := self model entityNamed: #'Smalltalk.TheRoot_class.mz'.
	theRoot := self model entityNamed: #'Smalltalk.TheRoot_class'.
	self assert: attribute isClassSide.
	self assert: attribute belongsTo equals: theRoot
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testMethodAnnotation [
	| method |
	method := self model entityNamed: 'Smalltalk.SubRootLevelOne.accessSuperclassInstVar()' ifAbsent: [ nil ].
	self assert: method name equals: #accessSuperclassInstVar.
	self assert: method protocol equals: #accessingSuperclassInstVar
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testMethodReification [

	| method |
	method := self model entityNamed:
		          'Smalltalk.SubRootLevelOne.accessSuperclassInstVar()'.
	self assert: method isNotNil.
	self
		assert: method belongsTo
		equals: (self model entityNamed: referenceModelSubRootLevelOneName).
	self deny: method isClassSide.
	self
		assert: method signature
		equals:
			(FamixSmalltalkNameResolver signatureFromSmalltalkSelectorOn:
				 #accessSuperclassInstVar)
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testOutOfModelInheritedInstanceVariableReified [
	| instVar |
	instVar := self model entityNamed: 'Smalltalk.Model.dependents'.
	self deny: instVar isClassSide.
	self assert: instVar belongsTo mooseName equals: Model mooseName
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testReadAndWrite [
	| accessDefinition |
	accessDefinition := self model allAccesses
		select: [ :acc | acc variable mooseName = 'Smalltalk.SubRootLevelOne.k' and: [ acc accessor mooseName = (SubRootLevelOne >> #accessTwiceTheSameVariableReadAndWrite) mooseName ] ].
	self assert: accessDefinition size equals: 2.
	self assert: (accessDefinition at: 1) isRead | (accessDefinition at: 1) isWrite.
	self assert: (accessDefinition at: 2) isRead | (accessDefinition at: 2) isWrite
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testReferenceBindingReified [
	| famixClass |
	famixClass := self model entityNamed: TestCase class mooseName.
	self assert: famixClass isNotNil
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testSelfAccessInDefiningClass [
	"TheRoot>>singleSelfSend
		self accessSharedVariableFromTheInstanceSide"

	self
		privateTestAccessingVar: #'Smalltalk.TheRoot.singleSelfSend().self'
		from: #'Smalltalk.TheRoot.singleSelfSend()'
		shouldBeRead: true
		hasAccessesSize: 1
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testSelfAccessInDefiningClassOnClassSide [
	self
		privateTestAccessingVar: #'Smalltalk.TheRoot_class.singleSelfSendOnClassSide().self'
		from: #'Smalltalk.TheRoot_class.singleSelfSendOnClassSide()'
		shouldBeRead: true
		hasAccessesSize: 1
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testSetterMethod [

	| methodUniqueName method |
	methodUniqueName := (TheRoot >> #x:) mooseName.
	method := self model entityNamed: methodUniqueName.
	self assert: method isNotNil.
	self
		assert: method belongsTo
		equals: (self model entityNamed: TheRoot mooseName).
	self deny: method isClassSide.
	self
		assert: method signature
		equals:
		(FamixSmalltalkNameResolver signatureFromSmalltalkSelectorOn: #x:).
	self assert: method isPureAccessor.
	self assert: method isSetter
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testSharedVariableReification [
	| shared |
	shared := self model entityNamed: #'Smalltalk.TheRoot.TheRootSharedVariable'.
	self assert: shared isClassSide.
	self assert: shared isSharedVariable.
	self assert: shared belongsTo equals: (self model entityNamed: TheRoot mooseName)
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testSingleSelfSend [
	| invocations calleeMethodName callingMethodUniqueName |
	"We want to make sure that we represent well that 
	TheRoot>>singleSelfSend

			self accessSharedVariableFromTheInstanceSide"
	calleeMethodName := #accessSharedVariableFromTheInstanceSide.
	callingMethodUniqueName := (TheRoot >> #singleSelfSend) mooseName.
	invocations := self model allInvocations
		select: [ :invocation | 
			invocation signature = (FamixSmalltalkNameResolver signatureFromSmalltalkSelectorOn: calleeMethodName)
				and: [ invocation sender mooseName = callingMethodUniqueName ] ].
	self assert: invocations size equals: 1
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testSingleSelfSendOnClassSide [
	| invocations calleeMethodName callingMethodUniqueName |
	"Want to represent
	TheRoot class>>accessSharedVariableFromTheClassSide
			TheRootSharedVariable := 4"
	calleeMethodName := #accessSharedVariableFromTheClassSide.
	callingMethodUniqueName := (TheRoot class >> #singleSelfSendOnClassSide) mooseName.
	invocations := self model allInvocations
		select: [ :invocation | 
			invocation signature = (FamixSmalltalkNameResolver signatureFromSmalltalkSelectorOn: calleeMethodName)
				and: [ invocation sender mooseName = callingMethodUniqueName ] ].
	self assert: invocations size equals: 1.
	self assert: invocations first receiver mooseName equals: #'Smalltalk.TheRoot_class.singleSelfSendOnClassSide().self'
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testSingleSelfSendWithReturn [
	| invocations calleeMethodName callingMethodUniqueName |
	"We want to make sure that we represent well
	TheRoot>>returningSingleSelfSend

		^self accessSharedVariableFromTheInstanceSide"
	calleeMethodName := #accessSharedVariableFromTheInstanceSide.
	callingMethodUniqueName := (TheRoot >> #returningSingleSelfSend) mooseName.
	invocations := self model allInvocations
		select: [ :invocation | 
			invocation signature = (FamixSmalltalkNameResolver signatureFromSmalltalkSelectorOn: calleeMethodName)
				and: [ invocation sender mooseName = callingMethodUniqueName ] ].
	self assert: invocations size equals: 1
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testStubInstanceVariableReified [
	| instVar |
	instVar := self model entityNamed: 'Smalltalk.Model.dependents'.
	self deny: instVar isNil.
	self assert: instVar isStub
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testStubSharedVariableAccess [
	"We want to test OtherRootFromClass>>accessingStubSharedVariable"

	| methodName classVarUniqueName accessDefinition |
	methodName := (OtherRootFromClass >> #accessingStubSharedVariable) mooseName.
	classVarUniqueName := Behavior @ #ClassProperties.
	accessDefinition := self model allAccesses select: [ :acc | acc variable mooseName = classVarUniqueName and: [ acc accessor mooseName = methodName ] ].
	self assert: accessDefinition size equals: 1
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testStubSharedVariableReified [
	| classVar |
	classVar := self model entityNamed: 'Smalltalk.Behavior.ClassProperties'.
	self deny: classVar isNil.
	self assert: classVar isStub.
	self assert: classVar isSharedVariable.
	self assert: classVar belongsTo equals: (self model entityNamed: Behavior mooseName)
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testSubRootLevelOneInheritsFromTheRoot [
	| referenceModelSubRootLevelOne |
	referenceModelSubRootLevelOne := self model entityNamed: referenceModelSubRootLevelOneName.
	self assert: referenceModelSubRootLevelOne superInheritances size equals: 1.
	self assert: (referenceModelSubRootLevelOne superInheritances at: 1) superclass name equals: TheRoot name.
	self assert: (referenceModelSubRootLevelOne superInheritances at: 1) subclass name equals: SubRootLevelOne name.
	self assert: (referenceModelSubRootLevelOne superInheritances at: 1) superclass name equals: TheRoot name.
	self assertEmpty: referenceModelSubRootLevelOne subInheritances
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testTheRootInheritsFromUIModel [
	| referenceModelTheRoot |
	referenceModelTheRoot := self model entityNamed: referenceModelTheRootName.
	self assert: (referenceModelTheRoot superInheritances at: 1) superclass name equals: Model name.
	self assert: referenceModelTheRoot subInheritances size equals: 3.
	self assert: (referenceModelTheRoot subInheritances at: 1) superclass name equals: TheRoot name.
	self assert: ((referenceModelTheRoot subInheritances collect: [ :each | each subclass name ]) includes: SubRootLevelOne name)
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testUnknownVariableAccess [

	self
		privateTestAccessingVar: #undeclaredStubInstVar
		from: #'Smalltalk.TheRoot.accessingUnknowVariable()'
		shouldBeRead: true
		hasAccessesSize: 1
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testUnknownVariableReified [
	self deny: (self model entityNamed: #undeclaredStubInstVar) isNil
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testUsedClassReified [
	| className famixClass |
	className := Object mooseName.
	famixClass := self model entityNamed: className ifAbsent: [ nil ].
	self assert: famixClass isNotNil.
	self assert: famixClass isStub
]

{ #category : #tests }
FamixReferenceModelImporterTest >> testUsedClassReifiedWithinReturn [
	| className famixClass |
	className := String class mooseName.
	famixClass := self model entityNamed: className.
	self assert: famixClass isNotNil.
	self assert: famixClass isStub
]
