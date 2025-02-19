Class {
	#name : #FamixJavaFusionnerTest,
	#superclass : #TestCase,
	#instVars : [
		'resourceModel',
		'consumerModel',
		'fusionner'
	],
	#category : #'FamixFusionner-Tests'
}

{ #category : #running }
FamixJavaFusionnerTest >> attribute: attributeName class: className [

	| entity |
	entity := resourceModel newAttributeNamed: attributeName.
	entity isStub: false.
	className ifNotNil: [ entity parentType: (resourceModel entityNamed: className) ].
	entity := consumerModel newAttributeNamed: attributeName.
	entity isStub: true.
	className ifNotNil: [ entity parentType: (consumerModel entityNamed: className) ]

]

{ #category : #running }
FamixJavaFusionnerTest >> class: aName [

	(resourceModel newClassNamed: aName) isStub: false.
	(consumerModel newClassNamed: aName) isStub: true.

]

{ #category : #running }
FamixJavaFusionnerTest >> class: subName inheritsFrom: superName [
	"note: Associations don't have a #isStub property"

	resourceModel newInheritance
		subclass: (resourceModel entityNamed: subName) ;
		superclass: (resourceModel entityNamed: superName).
	consumerModel newInheritance
		subclass: (consumerModel entityNamed: subName) ;
		superclass: (consumerModel entityNamed: superName)
]

{ #category : #running }
FamixJavaFusionnerTest >> consumerClass: subName inheritsFrom: superName [

	consumerModel newInheritance
		superclass: (consumerModel entityNamed: superName) ;
		subclass: (consumerModel newClassNamed: subName)

]

{ #category : #running }
FamixJavaFusionnerTest >> consumerVariable: varName declaredType: typeName [

	(consumerModel newLocalVariableNamed: varName)
		declaredType: (consumerModel entityNamed: typeName).
]

{ #category : #running }
FamixJavaFusionnerTest >> exception: aName [

	(resourceModel newExceptionNamed: aName) isStub: false.
	(consumerModel newExceptionNamed: aName) isStub: true.

]

{ #category : #running }
FamixJavaFusionnerTest >> interface: aName [

	resourceModel newInterface
		name: aName ;
		isStub: false.
	consumerModel newInterface
		name: aName ;
		isStub: true.

]

{ #category : #running }
FamixJavaFusionnerTest >> localVariable: variableName method: methodName [

	| entity |
	entity := resourceModel newLocalVariableNamed: variableName.
	entity isStub: false.
	methodName ifNotNil: [ entity parentBehaviouralEntity: (resourceModel entityNamed: methodName) ].
	entity := consumerModel newLocalVariableNamed: variableName.
	entity isStub: true.
	methodName ifNotNil: [ entity parentBehaviouralEntity: (consumerModel entityNamed: methodName) ]

]

{ #category : #running }
FamixJavaFusionnerTest >> method: methodName class: className [

	| entity |
	entity := resourceModel newMethodNamed: methodName.
	entity isStub: false.
	className ifNotNil: [ entity parentType: (resourceModel entityNamed: className) ].
	entity := consumerModel newMethodNamed: methodName.
	entity isStub: true.
	className ifNotNil: [ entity parentType: (consumerModel entityNamed: className) ]

]

{ #category : #running }
FamixJavaFusionnerTest >> package: aName [

	(resourceModel newPackageNamed: aName) isStub: false.
	(consumerModel newPackageNamed: aName) isStub: true.

]

{ #category : #running }
FamixJavaFusionnerTest >> parameter: parameterName method: methodName [

	| entity |
	entity := resourceModel newParameterNamed: parameterName.
	entity isStub: false.
	methodName ifNotNil: [ entity parentBehaviouralEntity: (resourceModel entityNamed: methodName) ].
	entity := consumerModel newParameterNamed: parameterName.
	entity isStub: true.
	methodName ifNotNil: [ entity parentBehaviouralEntity: (consumerModel entityNamed: methodName) ]

]

{ #category : #running }
FamixJavaFusionnerTest >> setUp [
	super setUp.

	resourceModel := FamixJavaModel new name: 'resourceModel'.
	consumerModel := FamixJavaModel new name: 'consumerModel'.
	fusionner := FamixFusionnerJava new
		resourceModel: resourceModel ;
		consumerModel: consumerModel 
]

{ #category : #tests }
FamixJavaFusionnerTest >> testAccessedStubAttribute [
	"non stub method accessing a stub attribute"

	| access |
	self attribute: 'att' class: nil.
	consumerModel newAccess
		accessor: (consumerModel newMethodNamed: 'meth') ;
		variable: (consumerModel entityNamed: 'att').

	self assert: consumerModel size equals: 3.
	self assert: resourceModel size equals: 1.

	fusionner fusion.

	self assert: consumerModel size equals: 2.
	self assert: resourceModel size equals: 1.

	self assert: (consumerModel entityNamed: 'meth') accesses size equals: 1.
	access := (consumerModel entityNamed: 'meth') accesses anyOne.
	self assert: access variable equals: (resourceModel entityNamed: 'att').

]

{ #category : #tests }
FamixJavaFusionnerTest >> testAccessedStubLocalVariable [
	"non stub method accessing a stub attribute...."

	| access |
	self localVariable: 'var' method: nil.
	consumerModel newAccess
		accessor: (consumerModel newMethodNamed: 'meth') ;
		variable: (consumerModel entityNamed: 'var').

	self assert: consumerModel size equals: 3.
	self assert: resourceModel size equals: 1.

	fusionner fusion.

	self assert: consumerModel size equals: 2.
	self assert: resourceModel size equals: 1.

	self assert: (consumerModel entityNamed: 'meth') accesses size equals: 1.
	access := (consumerModel entityNamed: 'meth') accesses anyOne.
	self assert: access variable equals: (resourceModel entityNamed: 'var').

]

{ #category : #tests }
FamixJavaFusionnerTest >> testAccessedStubParameter [
	"non stub method accessing a stub attribute...."

	| access |
	self parameter: 'param' method: nil.
	consumerModel newAccess
		accessor: (consumerModel newMethodNamed: 'meth') ;
		variable: (consumerModel entityNamed: 'param').

	self assert: consumerModel size equals: 3.
	self assert: resourceModel size equals: 1.

	fusionner fusion.

	self assert: consumerModel size equals: 2.
	self assert: resourceModel size equals: 1.

	self assert: (consumerModel entityNamed: 'meth') accesses size equals: 1.
	access := (consumerModel entityNamed: 'meth') accesses anyOne.
	self assert: access variable equals: (resourceModel entityNamed: 'param').

]

{ #category : #tests }
FamixJavaFusionnerTest >> testAttributeWithStubDeclaredType [

	self class: 'Blah'.
	(consumerModel newAttributeNamed: 'att')
		stub: false ;
		declaredType: (consumerModel entityNamed: 'Blah').

	self assert: consumerModel size equals: 2.
	self assert: resourceModel size equals: 1.

	fusionner fusion.

	self assert: consumerModel size equals: 1.
	self assert: resourceModel size equals: 1.

	self assert: (consumerModel entityNamed: 'Blah') isNil.
	self
		assert: (consumerModel entityNamed: 'att') declaredType
		equals: (resourceModel entityNamed: 'Blah').

	self assert: (resourceModel entityNamed: 'Blah') typedEntities size equals: 1.
	self
		assert: (resourceModel entityNamed: 'Blah') typedEntities anyOne 
		equals: (consumerModel entityNamed: 'att')
]

{ #category : #tests }
FamixJavaFusionnerTest >> testClassImplementingStubInterface [

	self interface: 'IBlah'.
	consumerModel newClassNamed: 'Blah'.
	consumerModel newImplementation
		implementingClass: (consumerModel entityNamed: 'Blah') ;
		interface: (consumerModel entityNamed: 'IBlah').

	self assert: consumerModel size equals: 3.
	self assert: resourceModel size equals: 1.
	
	fusionner fusion.

	self assert: consumerModel size equals: 2.
	self assert: resourceModel size equals: 1.
]

{ #category : #tests }
FamixJavaFusionnerTest >> testDoNotReplaceStubResourceEntity [

	self class: 'Blah'.
	(resourceModel entityNamed: 'Blah') stub: true.
	self consumerVariable: 'var' declaredType: 'Blah'.

	self assert: consumerModel size equals: 2.
	self assert: resourceModel size equals: 1.

	fusionner fusion.

	self assert: consumerModel size equals: 2.
	self assert: resourceModel size equals: 1.

	self assert: (consumerModel entityNamed: 'Blah') isNotNil.
	self
		assert: (consumerModel entityNamed: 'var') declaredType
		equals: (consumerModel entityNamed: 'Blah').

	self assert: (resourceModel entityNamed: 'Blah') typedEntities size equals: 0.

]

{ #category : #tests }
FamixJavaFusionnerTest >> testLocalVariableWithStubDeclaredType [

	self class: 'Blah'.
	(consumerModel newLocalVariableNamed: 'var')
		stub: false ;
		declaredType: (consumerModel entityNamed: 'Blah').

	self assert: consumerModel size equals: 2.
	self assert: resourceModel size equals: 1.

	fusionner fusion.

	self assert: consumerModel size equals: 1.
	self assert: resourceModel size equals: 1.

	self assert: (consumerModel entityNamed: 'Blah') isNil.
	self
		assert: (consumerModel entityNamed: 'var') declaredType
		equals: (resourceModel entityNamed: 'Blah').

	self assert: (resourceModel entityNamed: 'Blah') typedEntities size equals: 1.
	self
		assert: (resourceModel entityNamed: 'Blah') typedEntities anyOne 
		equals: (consumerModel entityNamed: 'var')
]

{ #category : #tests }
FamixJavaFusionnerTest >> testMethodCatchStubException [

	| except |

	self exception: 'Except'.
	(consumerModel newMethodNamed: 'meth')
		addCaughtException: (consumerModel entityNamed: 'Except').

	self assert: consumerModel size equals: 2.
	self assert: resourceModel size equals: 1.

	fusionner fusion.

	self assert: consumerModel size equals: 1.
	self assert: resourceModel size equals: 1.

	self assert: (consumerModel entityNamed: 'Except') isNil.

	self assert: (consumerModel entityNamed: 'meth') caughtExceptions size equals: 1.
	except := (consumerModel entityNamed: 'meth') caughtExceptions anyOne.

	self assert: except equals: (resourceModel entityNamed: 'Except')
]

{ #category : #tests }
FamixJavaFusionnerTest >> testMethodDeclareStubException [

	| except |

	self exception: 'Except'.
	(consumerModel newMethodNamed: 'meth')
		addDeclaredException: (consumerModel entityNamed: 'Except').

	self assert: consumerModel size equals: 2.
	self assert: resourceModel size equals: 1.

	fusionner fusion.

	self assert: consumerModel size equals: 1.
	self assert: resourceModel size equals: 1.

	self assert: (consumerModel entityNamed: 'Except') isNil.

	self assert: (consumerModel entityNamed: 'meth') declaredExceptions size equals: 1.
	except := (consumerModel entityNamed: 'meth') declaredExceptions anyOne.

	self assert: except equals: (resourceModel entityNamed: 'Except')
]

{ #category : #tests }
FamixJavaFusionnerTest >> testMethodThrowStubException [

	| except |

	self exception: 'Except'.
	(consumerModel newMethodNamed: 'meth')
		addThrownException: (consumerModel entityNamed: 'Except').

	self assert: consumerModel size equals: 2.
	self assert: resourceModel size equals: 1.

	fusionner fusion.

	self assert: consumerModel size equals: 1.
	self assert: resourceModel size equals: 1.

	self assert: (consumerModel entityNamed: 'Except') isNil.

	self assert: (consumerModel entityNamed: 'meth') thrownExceptions size equals: 1.
	except := (consumerModel entityNamed: 'meth') thrownExceptions anyOne.

	self assert: except equals: (resourceModel entityNamed: 'Except')
]

{ #category : #tests }
FamixJavaFusionnerTest >> testMethodWithStubDeclaredType [

	self class: 'Blah'.
	(consumerModel newMethodNamed: 'meth')
		stub: false ;
		declaredType: (consumerModel entityNamed: 'Blah').

	self assert: consumerModel size equals: 2.
	self assert: resourceModel size equals: 1.

	fusionner fusion.

	self assert: consumerModel size equals: 1.
	self assert: resourceModel size equals: 1.

	self assert: (consumerModel entityNamed: 'Blah') isNil.
	self
		assert: (consumerModel entityNamed: 'meth') declaredType
		equals: (resourceModel entityNamed: 'Blah').

	self assert: (resourceModel entityNamed: 'Blah') typedEntities size equals: 1.
	self
		assert: (resourceModel entityNamed: 'Blah') typedEntities anyOne 
		equals: (consumerModel entityNamed: 'meth')
]

{ #category : #tests }
FamixJavaFusionnerTest >> testParameterWithStubDeclaredType [

	self class: 'Blah'.
	(consumerModel newParameterNamed: 'param')
		stub: false ;
		declaredType: (consumerModel entityNamed: 'Blah').

	self assert: consumerModel size equals: 2.
	self assert: resourceModel size equals: 1.

	fusionner fusion.

	self assert: consumerModel size equals: 1.
	self assert: resourceModel size equals: 1.

	self assert: (consumerModel entityNamed: 'Blah') isNil.
	self
		assert: (consumerModel entityNamed: 'param') declaredType
		equals: (resourceModel entityNamed: 'Blah').

	self assert: (resourceModel entityNamed: 'Blah') typedEntities size equals: 1.
	self
		assert: (resourceModel entityNamed: 'Blah') typedEntities anyOne 
		equals: (consumerModel entityNamed: 'param')
]

{ #category : #tests }
FamixJavaFusionnerTest >> testReferencedStubClass [
	"non stub method referencing a stub class"

	| reference |
	self class: 'Blah'.
	consumerModel newReference
		referencer: (consumerModel newMethodNamed: 'meth') ;
		referredEntity: (consumerModel entityNamed: 'Blah').

	self assert: consumerModel size equals: 3.
	self assert: resourceModel size equals: 1.

	fusionner fusion.

	self assert: consumerModel size equals: 2.
	self assert: resourceModel size equals: 1.

	self assert: (consumerModel entityNamed: 'meth') outgoingReferences size equals: 1.
	reference := (consumerModel entityNamed: 'meth') outgoingReferences anyOne.
	self assert: reference referredEntity equals: (resourceModel entityNamed: 'Blah').

]

{ #category : #tests }
FamixJavaFusionnerTest >> testSeveralClassesWithOneStubSuperClass [

	self class: 'SuperBlah'.
	self consumerClass: 'Blah1' inheritsFrom: 'SuperBlah'.
	self consumerClass: 'Blah2' inheritsFrom: 'SuperBlah'.
	self consumerClass: 'Blah3' inheritsFrom: 'SuperBlah'.
	self consumerClass: 'Blah4' inheritsFrom: 'SuperBlah'.
	self consumerClass: 'Blah5' inheritsFrom: 'SuperBlah'.

	self assert: consumerModel size equals: 11.
	self assert: resourceModel size equals: 1.

	fusionner fusion.

	self assert: consumerModel size equals: 10.
	self assert: resourceModel size equals: 1.

	self assert: (consumerModel entityNamed: 'SuperBlah') isNil.

	self assert: (resourceModel entityNamed: 'SuperBlah') subInheritances size equals: 5.

	#(Blah1 Blah2 Blah3 Blah4 Blah5) do: [ :subname |
		self
			assert: (consumerModel entityNamed: subname) superclass
			equals: (resourceModel entityNamed: 'SuperBlah')
	]

]

{ #category : #tests }
FamixJavaFusionnerTest >> testSeveralVariableWithStubDeclaredType [

	self class: 'Blah'.
	self consumerVariable: 'var1' declaredType: 'Blah'.
	self consumerVariable: 'var2' declaredType: 'Blah'.
	self consumerVariable: 'var3' declaredType: 'Blah'.
	self consumerVariable: 'var4' declaredType: 'Blah'.
	self consumerVariable: 'var5' declaredType: 'Blah'.

	self assert: consumerModel size equals: 6.
	self assert: resourceModel size equals: 1.

	fusionner fusion.

	self assert: consumerModel size equals: 5.
	self assert: resourceModel size equals: 1.

	self assert: (consumerModel entityNamed: 'Blah') isNil.

	self assert: (resourceModel entityNamed: 'Blah') typedEntities size equals: 5.

	#(var1 var2 var3 var4 var5) do: [ :varname |
		self
			assert: (consumerModel entityNamed: varname) declaredType
			equals: (resourceModel entityNamed: 'Blah')
	]

]

{ #category : #tests }
FamixJavaFusionnerTest >> testStubClass [

	self class: 'Blah'.
	fusionner fusion.

	self assert: consumerModel size equals: 0.
	self assert: resourceModel size equals: 1.
]

{ #category : #tests }
FamixJavaFusionnerTest >> testStubClassAndAttribute [

	self class: 'Blah'.
	self attribute: 'att1' class: 'Blah'.

	self assert: consumerModel size equals: 2.
	self assert: resourceModel size equals: 2.
	
	fusionner fusion.

	self assert: consumerModel size equals: 0.
	self assert: resourceModel size equals: 2.
]

{ #category : #tests }
FamixJavaFusionnerTest >> testStubClassAndMethod [

	self class: 'Blah'.
	self method: 'mth' class: 'Blah'.

	self assert: consumerModel size equals: 2.
	self assert: resourceModel size equals: 2.
	
	fusionner fusion.

	self assert: consumerModel size equals: 0.
	self assert: resourceModel size equals: 2.
]

{ #category : #tests }
FamixJavaFusionnerTest >> testStubClassAndSuperClass [

	self class: 'Blah'.
	self class: 'SuperBlah'.
	resourceModel newInheritance
		superclass: (resourceModel entityNamed: 'SuperBlah') ;
		subclass: (resourceModel entityNamed: 'Blah').
	consumerModel newInheritance
		superclass: (consumerModel entityNamed: 'SuperBlah') ;
		subclass: (consumerModel entityNamed: 'Blah').

	self assert: consumerModel size equals: 3.
	self assert: resourceModel size equals: 3.

	fusionner fusion.

	self assert: consumerModel size equals: 0.
	self assert: resourceModel size equals: 3.

	self
		assert: (resourceModel entityNamed: 'Blah') superclass
		equals: (resourceModel entityNamed: 'SuperBlah')
]

{ #category : #tests }
FamixJavaFusionnerTest >> testStubClassInvocationReceiver [
	"note: need the sender of the invocation to verify that the invocation is not stub"

	| invoc |
	self class: 'Blah'.
	consumerModel newInvocation
		sender: (consumerModel newMethodNamed: 'caller') ;
		receiver: (consumerModel entityNamed: 'Blah').

	self assert: consumerModel size equals: 3.
	self assert: resourceModel size equals: 1.
	
	fusionner fusion.

	self assert: consumerModel size equals: 2.
	self assert: resourceModel size equals: 1.

	self assert: (consumerModel entityNamed: 'caller') outgoingInvocations size equals: 1.
	invoc := (consumerModel entityNamed: 'caller') outgoingInvocations anyOne.
	self assert: invoc sender equals: (consumerModel entityNamed: 'caller').
	self assert: invoc receiver equals: (resourceModel entityNamed: 'Blah').

	self assert: (resourceModel entityNamed: 'Blah') receivingInvocations size equals: 1.
	self
		assert: (resourceModel entityNamed: 'Blah') receivingInvocations anyOne mooseModel
		equals: consumerModel.

]

{ #category : #tests }
FamixJavaFusionnerTest >> testStubClassWithStubInheritance [

	self class: 'Blah'.
	self class: 'SuperBlah'.
	self class: 'Blah' inheritsFrom: 'SuperBlah'.

	self assert: consumerModel size equals: 3.
	self assert: resourceModel size equals: 3.
	
	fusionner fusion.

	self assert: consumerModel size equals: 0.
	self assert: resourceModel size equals: 3.
]

{ #category : #tests }
FamixJavaFusionnerTest >> testStubExceptionWithStubSub [
	"note: inheritance is visited twice for Exceptions (as Exception and as Class).
	 If sub is a stub, inheritance link needs to be replaced also"

	self exception: 'Blah'.
	self exception: 'SuperBlah'.
	resourceModel newInheritance
		superclass: (resourceModel entityNamed: 'SuperBlah') ;
		subclass: (resourceModel entityNamed: 'Blah').
	consumerModel newInheritance
		superclass: (consumerModel entityNamed: 'SuperBlah') ;
		subclass: (consumerModel entityNamed: 'Blah').

	self assert: consumerModel size equals: 3.
	self assert: resourceModel size equals: 3.

	fusionner fusion.

	self assert: consumerModel size equals: 0.
	self assert: resourceModel size equals: 3.

	self
		assert: (resourceModel entityNamed: 'Blah') superclass
		equals: (resourceModel entityNamed: 'SuperBlah')
]

{ #category : #tests }
FamixJavaFusionnerTest >> testStubInvokedMethod [

	| invoc |
	self method: 'meth' class: nil.
	consumerModel newInvocation
		sender: (consumerModel newMethodNamed: 'caller') ;
		candidates: { consumerModel entityNamed: 'meth' }.

	self assert: consumerModel size equals: 3.
	self assert: resourceModel size equals: 1.
	
	fusionner fusion.

	self assert: consumerModel size equals: 2.
	self assert: resourceModel size equals: 1.

	self assert: (consumerModel entityNamed: 'caller') outgoingInvocations size equals: 1.
	invoc := (consumerModel entityNamed: 'caller') outgoingInvocations anyOne.
	self assert: invoc sender equals: (consumerModel entityNamed: 'caller').
	self assert: invoc invokedEntity equals: (resourceModel entityNamed: 'meth').

]

{ #category : #tests }
FamixJavaFusionnerTest >> testStubSuperClass [
	"non-stub class inheriting from stub class"

	self class: 'SuperBlah'.
	(consumerModel newClassNamed: 'Blah') isStub: false.
	consumerModel newInheritance
		superclass: (consumerModel entityNamed: 'SuperBlah') ;
		subclass: (consumerModel entityNamed: 'Blah').

	self assert: consumerModel size equals: 3.
	self assert: resourceModel size equals: 1.

	fusionner fusion.

	self assert: consumerModel size equals: 2.
	self assert: resourceModel size equals: 1.

	self assert: (consumerModel entityNamed: 'SuperBlah') isNil.
	self
		assert: (consumerModel entityNamed: 'Blah') superclass
		equals: (resourceModel entityNamed: 'SuperBlah')
]

{ #category : #tests }
FamixJavaFusionnerTest >> testVariableWithStubDeclaredType [

	self class: 'Blah'.
	(consumerModel newLocalVariableNamed: 'var')
		stub: false ;
		declaredType: (consumerModel entityNamed: 'Blah').

	self assert: consumerModel size equals: 2.
	self assert: resourceModel size equals: 1.

	fusionner fusion.

	self assert: consumerModel size equals: 1.
	self assert: resourceModel size equals: 1.

	self assert: (consumerModel entityNamed: 'Blah') isNil.
	self
		assert: (consumerModel entityNamed: 'var') declaredType
		equals: (resourceModel entityNamed: 'Blah').

	self assert: (resourceModel entityNamed: 'Blah') typedEntities size equals: 1.
	self
		assert: (resourceModel entityNamed: 'Blah') typedEntities anyOne 
		equals: (consumerModel entityNamed: 'var')
]

{ #category : #running }
FamixJavaFusionnerTest >> variable: aName [

	(resourceModel newLocalVariableNamed: aName) isStub: false.
	(consumerModel newLocalVariableNamed: aName) isStub: true.

]

{ #category : #running }
FamixJavaFusionnerTest >> variable: varName declaredType: typeName [

	(resourceModel newLocalVariableNamed: varName)
		isStub: false ;
		declaredType: (resourceModel entityNamed: typeName).
	(consumerModel newLocalVariableNamed: varName)
		isStub: true ;
		declaredType: (consumerModel entityNamed: typeName).

]
