Class {
	#name : 'MooseQueryTest',
	#superclass : 'TestCase',
	#instVars : [
		'model',
		'class1',
		'class2',
		'inh',
		'method1',
		'var2',
		'access',
		'method2',
		'method3',
		'inv1',
		'inv2',
		'package1',
		'inv3',
		'package2',
		'var1',
		'acc1',
		'namespace',
		'ref1',
		'methodExt',
		'isolatedPackage',
		'isolatedClass',
		'isolatedMethod',
		'localVariable',
		'anchor'
	],
	#category : 'Moose-Query-Test',
	#package : 'Moose-Query-Test'
}

{ #category : 'accessing' }
MooseQueryTest >> model [
	^ model
]

{ #category : 'running' }
MooseQueryTest >> setUp [
	super setUp.
	model := FamixJavaModel new.
	package1 := (FamixJavaPackage named: 'package1') mooseModel: model.
	package2 := (FamixJavaPackage named: 'package2') mooseModel: model.
	isolatedPackage := (FamixJavaPackage named: 'isolatedPackage') mooseModel: model.
	anchor := (FamixJavaSourceTextAnchor new) mooseModel: model.
	class1 := (FamixJavaClass named: 'class1')
		parentPackage: package1;
		sourceAnchor: anchor;
		mooseModel: model.
	
	class2 := (FamixJavaClass named: 'class2')
		parentPackage: package2;
		mooseModel: model.
	isolatedClass := (FamixJavaClass named: 'isolatedClass')
		parentPackage: isolatedPackage;
		mooseModel: model.
	inh := FamixJavaInheritance new
		subclass: class1;
		superclass: class2;
		mooseModel: model.
	method1 := (FamixJavaMethod named: 'method1')
		parentType: class1;
		mooseModel: model.
	method2 := (FamixJavaMethod named: 'method2')
		parentType: class2;
		mooseModel: model.
	method3 := (FamixJavaMethod named: 'method3')
		parentType: class2;
		mooseModel: model.
	isolatedMethod := (FamixJavaMethod named: 'isolatedMethod')
		parentType: isolatedClass;
		mooseModel: model.
	var1 := (FamixJavaAttribute named: 'var1')
		parentType: class2;
		typing: (FamixJavaEntityTyping new declaredType: class1);
		mooseModel: model.
	var2 := (FamixJavaAttribute named: 'var2')
		parentType: class2;
		mooseModel: model.
	localVariable := (FamixJavaLocalVariable named: 'var3')
		parentBehaviouralEntity: method2;
		typing: (FamixJavaEntityTyping new declaredType: class1);
		mooseModel: model.
	access := FamixJavaAccess new
		accessor: method1;
		variable: var2;
		mooseModel: model.
	acc1 := FamixJavaAccess new
		accessor: method2;
		variable: var1;
		mooseModel: model.
	inv1 := FamixJavaInvocation new
		sender: method1;
		addCandidate: method2;
		receiver: var2;
		mooseModel: model.
	inv2 := FamixJavaInvocation new
		sender: method2;
		addCandidate: method2;
		receiver: var2;
		mooseModel: model.
	inv3 := FamixJavaInvocation new
		sender: method3;
		addCandidate: method2;
		receiver: var2;
		mooseModel: model.
	ref1 := FamixJavaReference source: method1 target: class2 model: model
]

{ #category : 'tests' }
MooseQueryTest >> testAllAtScope [
	| package3 |
	self assertCollection: (class1 allAtScope: FamixTClass) hasSameElements: {class1}.
	self assertCollection: (class1 allAtScope: FamixTType) hasSameElements: {class1}.
	self assertCollection: (class1 allAtScope: FamixTPackage) hasSameElements: {package1}.

	package3 := FamixJavaPackage new
		name: 'package3';
		mooseModel: model.
	package1 parentPackage: package3.
	self assertCollection: (class1 allAtScope: FamixTPackage) hasSameElements: {package1 . package3}
]

{ #category : 'tests' }
MooseQueryTest >> testAllContainedEntities [

	self assert: package2 allContainedEntities size equals: 6.
	self assert: class2 allContainedEntities size equals: 5.
	self assert: method2 allContainedEntities size equals: 1
]

{ #category : 'tests' }
MooseQueryTest >> testAllContainedEntitiesOfAnyType [

	self
		assertCollection: (class2 query containedEntities recursively ofAnyType: {
					 FamixJavaMethod.
					 FamixJavaAttribute })
		hasSameElements: {
				method2.
				method3.
				var1.
				var2 }.
	self
		assertCollection: (class2 query containedEntities recursively ofAnyType: {
					 FamixJavaMethod.
					 FamixJavaLocalVariable })
		hasSameElements: {
				method2.
				method3.
				localVariable }.
	self
		assertCollection: (class2 query containedEntities recursively ofAnyType: {
					 FamixJavaMethod.
					 FamixTStructuralEntity })
		hasSameElements: {
				method2.
				method3.
				var1.
				var2.
				localVariable }.
	self
		assertCollection: (class2 query containedEntities recursively ofAnyType: {
					 FamixJavaClass.
					 FamixJavaMethod })
		hasSameElements: {
				class2.
				method2.
				method3 }.
	self
		assertCollection: (method1 query containedEntities recursively ofAnyType: {
					 FamixJavaClass.
					 FamixJavaPackage })
		hasSameElements: {  }
]

{ #category : 'tests' }
MooseQueryTest >> testAllContainedEntitiesOfAnyTypeUntil [

	self
		assertCollection: ((class2 query containedEntities recursively until: [ :entity | entity isOfType: FamixJavaMethod ]) ofAnyType: {
					 FamixJavaMethod.
					 FamixJavaLocalVariable })
		hasSameElements: {
				method2.
				method3 }.
	self
		assertCollection: ((class2 query containedEntities recursively until: [ :entity | entity isOfType: FamixJavaMethod ]) ofAnyType: {
					 FamixJavaMethod.
					 FamixTStructuralEntity })
		hasSameElements: {
				method2.
				method3.
				var1.
				var2 }
]

{ #category : 'tests' }
MooseQueryTest >> testAllContainers [

	self assert: package2 allContainers size equals: 0.
	self assert: class2 allContainers size equals: 1.
	self assert: method2 allContainers size equals: 2.
	self assert: var2 allContainers size equals: 2
]

{ #category : 'tests' }
MooseQueryTest >> testAllContainersOfAnyType [

	self assertCollection: (class1 query containers recursively ofAnyType: { FamixJavaClass }) hasSameElements: { class1 }.
	self assertCollection: (class1 query containers recursively ofAnyType: { FamixJavaPackage }) hasSameElements: { package1 }.
	self
		assertCollection: (class1 query containers recursively ofAnyType: {
					 FamixJavaClass.
					 FamixJavaPackage })
		hasSameElements: {
				class1.
				package1 }.
	self assertCollection: (class1 query containers recursively ofAnyType: { FamixJavaMethod }) hasSameElements: {  }.
	self assertCollection: (class1 query containers recursively ofAnyType: { FamixTClass }) hasSameElements: { class1 }.
	self assertCollection: (class1 query containers recursively ofAnyType: { FamixTPackage }) hasSameElements: { package1 }.
	self
		assertCollection: (class1 query containers recursively ofAnyType: {
					 FamixTClass.
					 FamixTPackage })
		hasSameElements: {
				class1.
				package1 }.
	self assertCollection: (class1 query containers recursively ofAnyType: { FamixTMethod }) hasSameElements: {  }
]

{ #category : 'tests' }
MooseQueryTest >> testAllContainersOfAnyTypeUntil [

	self
		assertCollection: ((class1 query containers recursively until: [ :famixEntity | famixEntity isOfType: FamixJavaClass ]) ofAnyType: { FamixJavaPackage })
		hasSameElements: {  }.
	self
		assertCollection: ((class1 query containers recursively until: [ :famixEntity | famixEntity isOfType: FamixJavaClass ]) ofAnyType: {
					 FamixJavaClass.
					 FamixJavaPackage })
		hasSameElements: { class1 }.

	self
		assertCollection: ((class1 query containers recursively until: [ :famixEntity | famixEntity isOfType: FamixTClass ]) ofAnyType: { FamixTPackage })
		hasSameElements: {  }.
	self
		assertCollection: ((class1 query containers recursively until: [ :famixEntity | famixEntity isOfType: FamixTClass ]) ofAnyType: {
					 FamixTClass.
					 FamixTPackage })
		hasSameElements: { class1 }
]

{ #category : 'tests' }
MooseQueryTest >> testAllContainersOfTypeUntil [

	| package3 |
	self
		assertCollection: ((class1 query containers recursively until: [ :famixEntity | famixEntity isOfType: FamixTClass ]) ofType: FamixTClass)
		hasSameElements: { class1 }.
	self
		assertCollection: ((class1 query containers recursively until: [ :famixEntity | famixEntity isOfType: FamixTClass ]) ofType: FamixTType)
		hasSameElements: { class1 }.
	self
		assertCollection: ((class1 query containers recursively until: [ :famixEntity | famixEntity isOfType: FamixTClass ]) ofType: FamixTPackage)
		hasSameElements: {  }.

	package3 := FamixJavaPackage new
		            name: 'package3';
		            mooseModel: model.
	package1 parentPackage: package3.
	self
		assertCollection: ((class1 query containers recursively until: [ :famixEntity | famixEntity name = 'package1' ]) ofType: FamixTPackage)
		hasSameElements: { package1 }
]

{ #category : 'tests' }
MooseQueryTest >> testAllContanedEntitiesOfTypeUntil [

	self
		assertCollection: ((class2 query containedEntities recursively until: [ :entity | entity isOfType: FamixTMethod ]) ofType: FamixTStructuralEntity)
		hasSameElements: {
				var1.
				var2 }.
	self
		assertCollection: ((package1 query containedEntities recursively until: [ :entity | entity isOfType: FamixTPackage ]) ofType: FamixTClass)
		hasSameElements: {  }.
	self
		assertCollection: ((package1 query containedEntities recursively until: [ :entity | entity isOfType: FamixTClass ]) ofType: FamixTClass)
		hasSameElements: { class1 }.
	FamixJavaClass new
		name: 'class3';
		typeContainer: class1;
		mooseModel: model.
	self
		assertCollection: ((class1 query containedEntities recursively until: [ :entity | entity name = 'class1' ]) ofType: FamixTClass)
		hasSameElements: { class1 }.
	self
		assertCollection: ((package1 query containedEntities recursively until: [ :entity | entity name = 'class1' ]) ofType: FamixTClass)
		hasSameElements: { class1 }
]

{ #category : 'tests' }
MooseQueryTest >> testAllIncoming [
	self assert: method2 queryAllIncoming size equals: 3.
	self assert: class2 queryAllIncoming size equals: 7
]

{ #category : 'tests' }
MooseQueryTest >> testAllOutgoing [

	self assert: method2 queryAllOutgoing size equals: 3.
	self assert: class2 queryAllOutgoing size equals: 5
]

{ #category : 'tests' }
MooseQueryTest >> testAllToScope [
	| class3 |
	self assertCollection: (class1 allToScope: FamixTMethod) hasSameElements: {method1}.
	self assertCollection: (class2 allToScope: FamixTAttribute) hasSameElements: {var1 . var2}.
	self assertCollection: (class2 allToScope: FamixTStructuralEntity) hasSameElements: {var1 . var2 . localVariable}.
	self assertCollection: (package1 allToScope: FamixTClass) hasSameElements: {class1}.
	class3 := FamixJavaClass new
		name: 'class3';
		typeContainer: class1;
		mooseModel: model.
	self assertCollection: (class1 allToScope: FamixTClass) hasSameElements: {class1 . class3}.
	self assertCollection: (package1 allToScope: FamixTClass) hasSameElements: {class1 . class3}
]

{ #category : 'tests' }
MooseQueryTest >> testAtScope [
	self assertCollection: (class1 atScope: FamixJavaClass) hasSameElements: {class1}.
	self assertCollection: (class1 atScope: FamixTType) hasSameElements: {class1}.
	self assertCollection: (class1 atScope: FamixTPackage) hasSameElements: {package1}
]

{ #category : 'tests' }
MooseQueryTest >> testContainedEntities [

	self assert: package2 containedEntities size equals: 1.
	self assert: package2 containedEntities anyOne equals: class2.
	self assert: class1 children size equals: 1.
	self assert: class1 children anyOne equals: method1
]

{ #category : 'tests' }
MooseQueryTest >> testContainedEntitiesOfAnyType [

	self
		assertCollection: (class2 query containedEntities ofAnyType: {
					 FamixJavaMethod.
					 FamixJavaAttribute })
		hasSameElements: {
				method2.
				method3.
				var1.
				var2 }.
	self
		assertCollection: (class2 query containedEntities ofAnyType: {
					 FamixJavaMethod.
					 FamixTStructuralEntity })
		hasSameElements: {
				method2.
				method3.
				var1.
				var2 }.
	self
		assertCollection: (class2 query containedEntities ofAnyType: {
					 FamixJavaClass.
					 FamixJavaMethod })
		hasSameElements: { class2 }.
	self
		assertCollection: (method1 query containedEntities ofAnyType: {
					 FamixJavaClass.
					 FamixJavaPackage })
		hasSameElements: {  }
]

{ #category : 'tests' }
MooseQueryTest >> testContainedEntitiesOfAnyTypeUntil [

	self
		assertCollection: ((class2 query containedEntities until: [ :el | el isOfType: FamixTMethod ]) ofAnyType: {
					 FamixJavaMethod.
					 FamixJavaAttribute })
		hasSameElements: {
				method2.
				method3.
				var1.
				var2 }.
	self
		assertCollection: ((class2 query containedEntities until: [ :el | el isOfType: FamixTClass ]) ofAnyType: {
					 FamixJavaMethod.
					 FamixJavaAttribute })
		hasSameElements: {  }.
	self
		assertCollection: ((class2 query containedEntities until: [ :el | el isOfType: FamixTMethod ]) ofAnyType: {
					 FamixJavaMethod.
					 FamixTStructuralEntity })
		hasSameElements: {
				method2.
				method3.
				var1.
				var2 }.
	self
		assertCollection: ((class2 query containedEntities until: [ :el | el isOfType: FamixTClass ]) ofAnyType: {
					 FamixJavaMethod.
					 FamixTStructuralEntity })
		hasSameElements: {  }.
	self
		assertCollection: ((class2 query containedEntities until: [ :el | el isOfType: FamixTClass ]) ofAnyType: {
					 FamixJavaClass.
					 FamixTLocalVariable })
		hasSameElements: { class2 }.
	self
		assertCollection: ((class2 query containedEntities until: [ :el | el isOfType: FamixTMethod ]) ofAnyType: {
					 FamixJavaClass.
					 FamixTLocalVariable })
		hasSameElements: { class2 }
]

{ #category : 'tests' }
MooseQueryTest >> testContainedEntitiesOfTypeUntil [

	self assertCollection: ((class1 query containedEntities until: [ :el | el isOfType: FamixTClass ]) ofType: FamixJavaMethod) hasSameElements: {  }.
	self assertCollection: ((class1 query containedEntities until: [ :el | el isOfType: FamixTMethod ]) ofType: FamixJavaMethod) hasSameElements: { method1 }.
	self assertCollection: ((class2 query containedEntities until: [ :el | el isOfType: FamixTAttribute ]) ofType: FamixJavaAttribute) hasSameElements: {
			var1.
			var2 }.
	self assertCollection: ((class2 query containedEntities until: [ :el | el isOfType: FamixTMethod ]) ofType: FamixJavaAttribute) hasSameElements: {
			var1.
			var2 }.
	self assertCollection: ((class2 query containedEntities until: [ :el | el isOfType: FamixTMethod ]) ofType: FamixTStructuralEntity) hasSameElements: {
			var1.
			var2 }.
	self assertCollection: ((class2 query containedEntities until: [ :el | el isOfType: FamixTClass ]) ofType: FamixTStructuralEntity) hasSameElements: {  }.
	self
		assertCollection: ((class2 query containedEntities until: [ :el | el isOfType: FamixTStructuralEntity ]) ofType: FamixTStructuralEntity)
		hasSameElements: {
				var1.
				var2.
				localVariable }
]

{ #category : 'tests' }
MooseQueryTest >> testContainedEntitySelectors [

	self assertCollection: class1 containedEntitySelectors hasSameElements: #( #types #attributes #methods #definedAnnotationTypes #comments )
]

{ #category : 'tests' }
MooseQueryTest >> testContainers [

	self assert: class2 containers size equals: 1.
	self assert: class2 containers anyOne equals: package2.
	self assert: method1 containers size equals: 1.
	self assert: method1 containers anyOne equals: class1
]

{ #category : 'tests' }
MooseQueryTest >> testContainersOfAnyType [

	self assertCollection: (class1 query containers ofAnyType: { FamixJavaClass }) hasSameElements: { class1 }.
	self assertCollection: (class1 query containers ofAnyType: { FamixJavaPackage }) hasSameElements: { package1 }.
	self
		assertCollection: (class1 query containers ofAnyType: {
					 FamixJavaClass.
					 FamixJavaPackage })
		hasSameElements: { class1 }.
	self assertCollection: (class1 query containers ofAnyType: { FamixJavaMethod }) hasSameElements: {  }.
	self assertCollection: (class1 query containers ofAnyType: { FamixTClass }) hasSameElements: { class1 }.
	self assertCollection: (class1 query containers ofAnyType: { FamixTPackage }) hasSameElements: { package1 }.
	self
		assertCollection: (class1 query containers ofAnyType: {
					 FamixTClass.
					 FamixTPackage })
		hasSameElements: { class1 }.
	self assertCollection: (class1 query containers ofAnyType: { FamixTMethod }) hasSameElements: {  }
]

{ #category : 'tests' }
MooseQueryTest >> testContainersOfTypeUntil [

	self assertCollection: ((class1 query containers until: [ :el | el isOfType: FamixTClass ]) ofType: FamixJavaClass) hasSameElements: { class1 }.
	self assertCollection: ((class1 query containers until: [ :el | el isOfType: FamixTClass ]) ofType: FamixTPackage) hasSameElements: {  }.
	self assertCollection: ((class1 query containers until: [ :el | el isOfType: FamixTPackage ]) ofType: FamixTPackage) hasSameElements: { package1 }
]

{ #category : 'tests' }
MooseQueryTest >> testContaniersOfAnyTypeUntil [

	self
		assertCollection: ((class1 query containers until: [ :entity | entity isOfType: FamixTPackage ]) ofAnyType: { FamixJavaPackage })
		hasSameElements: { package1 }.
	self assertCollection: ((class1 query containers until: [ :entity | entity isOfType: FamixTClass ]) ofAnyType: { FamixJavaPackage }) hasSameElements: {  }.
	self
		assertCollection: (class1 query containers ofAnyType: {
					 FamixJavaClass.
					 FamixJavaPackage })
		hasSameElements: { class1 }.
	self assertCollection: ((class1 query containers until: [ :entity | entity isOfType: FamixTClass ]) ofAnyType: { FamixTClass }) hasSameElements: { class1 }.
	self assertCollection: (class1 query containers ofAnyType: { FamixTPackage }) hasSameElements: { package1 }.
	self assertCollection: ((class1 query containers until: [ :entity | entity isOfType: FamixTClass ]) ofAnyType: { FamixTPackage }) hasSameElements: {  }.
	self
		assertCollection: ((class1 query containers until: [ :entity | entity isOfType: FamixTClass ]) ofAnyType: {
					 FamixTClass.
					 FamixTPackage })
		hasSameElements: { class1 }
]

{ #category : 'tests' }
MooseQueryTest >> testExplicitDirectionQueryEquivalentToQueryWithDirectionSymbol [
	"queryIncoming: is equivalent to query: #in with:"

	self
		assert: (method1 queryIncoming: FamixJavaInvocation)
		equals: (method1 query: #in with: FamixJavaInvocation).
	self
		assert: (class2 queryIncoming: FamixJavaInvocation)
		equals: (class2 query: #in with: FamixJavaInvocation).
	"queryOutgoing: is equivalent to query: #out with:"
	self
		assert: (method1 queryOutgoing: FamixJavaInvocation)
		equals: (method1 query: #out with: FamixJavaInvocation).
	self
		assert: (class2 queryOutgoing: FamixJavaInvocation)
		equals: (class2 query: #out with: FamixJavaInvocation)
]

{ #category : 'tests' }
MooseQueryTest >> testHasIncoming [

	self assert: (method2 hasIncoming).
	self assert: (class2 hasIncoming).
]

{ #category : 'tests' }
MooseQueryTest >> testHasIncomingInvocation [
	"queryIncoming: is equivalent to query: #in with:"

	self assert: (method2 hasIncoming: FamixTInvocation).
	self assert: (method2 has: #in with: FamixTInvocation).
	self assert: (class2 hasIncoming: FamixTInvocation).
	self assert: (class2 has: #in with: FamixTInvocation).
]

{ #category : 'tests' }
MooseQueryTest >> testHasLocalIncoming [

	self assert: method2 hasLocalIncoming.
	self assert: class1 hasLocalIncoming.
	self deny: package2 hasLocalIncoming
]

{ #category : 'tests' }
MooseQueryTest >> testHasLocalIncomingInvocation [

	self assert: (method2 hasLocalIncoming: FamixTInvocation).
	self deny: (class2 hasLocalIncoming: FamixTInvocation).
	self deny: (package2 hasLocalIncoming: FamixTInvocation).
]

{ #category : 'tests' }
MooseQueryTest >> testHasLocalOutgoing [
	self assert: method2 hasLocalOutgoing.
	self deny: class2 hasLocalOutgoing.
	self deny: package2 hasLocalOutgoing
]

{ #category : 'tests' }
MooseQueryTest >> testHasLocalOutgoingInvocation [

	self assert: (method2 hasLocalOutgoing: FamixTInvocation).
	self deny: (class2 hasLocalOutgoing: FamixTInvocation).
	self deny: (package2 hasLocalOutgoing: FamixTInvocation).
]

{ #category : 'tests' }
MooseQueryTest >> testHasNotIncoming [
	self deny: isolatedMethod hasIncoming.
	self deny: isolatedClass hasIncoming.
	self deny: isolatedPackage hasIncoming
]

{ #category : 'tests' }
MooseQueryTest >> testHasNotIncomingInvocation [
	"hasIncoming: is equivalent to has: #in with:"

	self deny: (isolatedMethod hasIncoming: FamixTInvocation).
	self deny: (isolatedMethod has: #in with: FamixTInvocation).
	self deny: (isolatedClass hasIncoming: FamixTInvocation).
	self deny: (isolatedClass has: #in with: FamixTInvocation).
	self deny: (isolatedPackage hasIncoming: FamixTInvocation).
	self deny: (isolatedPackage has: #in with: FamixTInvocation)
]

{ #category : 'tests' }
MooseQueryTest >> testHasNotLocalIncoming [
	self deny: isolatedMethod hasLocalIncoming.
	self deny: isolatedClass hasLocalIncoming.
	self deny: isolatedPackage hasLocalIncoming
]

{ #category : 'tests' }
MooseQueryTest >> testHasNotLocalOutgoing [
	self deny: isolatedMethod hasLocalOutgoing.
	self deny: isolatedClass hasLocalOutgoing.
	self deny: isolatedPackage hasLocalOutgoing
]

{ #category : 'tests' }
MooseQueryTest >> testHasNotOutgoing [
	self deny: isolatedMethod hasOutgoing.
	self deny: isolatedClass hasOutgoing.
	self deny: isolatedPackage hasOutgoing
]

{ #category : 'tests' }
MooseQueryTest >> testHasNotOutgoingInvocation [
	"hasOutgoing: is equivalent to has: #out with:"

	self deny: (isolatedMethod hasOutgoing: FamixTInvocation).
	self deny: (isolatedMethod has: #out with: FamixTInvocation).
	self deny: (isolatedClass hasOutgoing: FamixTInvocation).
	self deny: (isolatedClass has: #out with: FamixTInvocation).
	self deny: (isolatedPackage hasOutgoing: FamixTInvocation).
	self deny: (isolatedPackage has: #out with: FamixTInvocation)
]

{ #category : 'tests' }
MooseQueryTest >> testHasOutgoing [

	self assert: (method2 hasOutgoing).
	self assert: (class2 hasOutgoing).
]

{ #category : 'tests' }
MooseQueryTest >> testHasOutgoingInvocation [
	"queryOutgoing: is equivalent to query: #out with:"

	self assert: (method1 hasOutgoing: FamixTInvocation).
	self assert: (method1 has: #out with: FamixTInvocation).
	self assert: (class2 hasOutgoing: FamixTInvocation).
	self assert: (class2 has: #out with: FamixTInvocation)
]

{ #category : 'tests' }
MooseQueryTest >> testIncomingAssociationTypes [

	self
		assertCollection: var2 incomingAssociationTypes
		hasSameElements: { FamixTAccess }.
	self
		assertCollection: class1 incomingAssociationTypes
		hasSameElements: { 
				FamixTInheritance.
				FamixTReference.
				FamixTImport.
				FamixTEntityTyping }.
	self
		assertCollection: method1 incomingAssociationTypes
		hasSameElements: { 
				FamixTInvocation.
				FamixTImport }
]

{ #category : 'tests' }
MooseQueryTest >> testIncomingInvocation [
	"queryIncoming: is equivalent to query: #in with:"

	self assert: (method2 queryIncoming: FamixTInvocation) size equals: 3.
	self assert: (method2 query: #in with: FamixTInvocation) size equals: 3.
	self assert: (class2 queryIncoming: FamixTInvocation) size equals: 3.
	self assert: (class2 query: #in with: FamixTInvocation) size equals: 3
]

{ #category : 'tests' }
MooseQueryTest >> testIncomingInvocationAtScope [
	self
		assert: ((method2 queryIncoming: FamixTInvocation) atScope: FamixJavaPackage) size
		equals: 2.
	self
		assert: ((class2 queryIncoming: FamixTInvocation) atScope: FamixJavaPackage) size
		equals: 2
]

{ #category : 'tests' }
MooseQueryTest >> testObjectsQueryResultsKind [
	self assert: (method2 query incoming objects dependencies isKindOf: MooseObjectQueryResult)
]

{ #category : 'tests' }
MooseQueryTest >> testOutgoingAccessAtScope [
	self assert: ((method1 queryOutgoing: FamixTAccess) atScope: FamixJavaPackage) size equals: 1.
	self
		assert: ((method1 queryOutgoing: FamixTAccess) atScope: FamixJavaPackage) storage first
		equals: package2
]

{ #category : 'tests' }
MooseQueryTest >> testOutgoingAccessesWithANamespaceInANamespace [
	"queryOutgoing: is equivalent to query: #out with:"

	| packageContainer |
	packageContainer := FamixJavaPackage new
		name: 'Test';
		mooseModel: model;
		addChildEntity: package1.
	self assert: (packageContainer query: #out with: FamixTAccess) size equals: 1
]

{ #category : 'tests' }
MooseQueryTest >> testOutgoingAssociationTypes [

	self
		assertCollection: class1 outgoingAssociationTypes
		hasSameElements: {
				FamixTInheritance.
				FamixTImplementation.
				FamixTImport.
				FamixTConcretization }.
	self
		assertCollection: method1 outgoingAssociationTypes
		hasSameElements: {
				FamixTInvocation.
				FamixTReference.
				FamixTAccess.
				FamixTEntityTyping }
]

{ #category : 'tests' }
MooseQueryTest >> testOutgoingInvocation [
"queryOutgoing: is equivalent to query: #out with:"
	self assert: (method1 queryOutgoing: FamixTInvocation) size equals: 1.
	self assert: (method1 query: #out with: FamixTInvocation) size equals: 1.
	self assert: (class2 queryOutgoing: FamixTInvocation) size equals: 2.
	self assert: (class2 query: #out with: FamixTInvocation) size equals: 2.
]

{ #category : 'tests' }
MooseQueryTest >> testOutgoingInvocationAtScope [

	self assert: ((method2 queryOutgoing: FamixTInvocation) atScope: FamixJavaPackage) size equals: 1.
	self assert: ((class2 queryOutgoing: FamixTInvocation) atScope: FamixJavaPackage) size equals: 1.

]

{ #category : 'tests' }
MooseQueryTest >> testOutgoingInvocationWithin [
	self assert: ((method1 queryOutgoing: FamixTInvocation) within: class2) size equals: 1.

]

{ #category : 'tests' }
MooseQueryTest >> testQueryWith [
"queryIncoming: is equivalent to query: #in with:"
	self assert: (package1 query: #out with: FamixTInvocation) size equals: 1.
]

{ #category : 'tests' }
MooseQueryTest >> testSourceThroughAll [
	self assertCollection: method2 throughAllFrom storage flattened hasSameElements: {method2 . method1 . method3}.
	self assertCollection: class2 throughAllFrom storage flattened hasSameElements: {method2 . method1 . method3 . class1}
]

{ #category : 'tests' }
MooseQueryTest >> testSourceThroughInvocation [

	self
		assertCollection:
		(method2 sourceThrough: FamixTInvocation) storage flattened
		hasSameElements: { 
				method2.
				method1.
				method3 }.

	self
		assertCollection: (method2 sourceThrough: FamixTInvocation)
		hasSameElements:
		((method2 queryIncoming: FamixTInvocation) collect: #source).

	self
		assertCollection:
		(class2 sourceThrough: FamixTInvocation) storage flattened
		hasSameElements: { 
				method2.
				method1.
				method3 }
]

{ #category : 'tests' }
MooseQueryTest >> testTargetThroughInvocation [

	self
		assertCollection:
		(method1 targetThrough: FamixTInvocation) storage flattened
		hasSameElements: { method2 }.
	self
		assertCollection: (method1 targetThrough: FamixTInvocation)
		hasSameElements:
		((method1 queryOutgoing: FamixTInvocation) flatCollect: #target).
	self
		assertCollection:
		(class2 targetThrough: FamixTInvocation) storage flattened
		hasSameElements: { method2 }
]

{ #category : 'tests' }
MooseQueryTest >> testThrougAllIncoming [
	self assert: method2 queryAllIncoming size equals: 3.
	self assert: class2 queryAllIncoming size equals: 7
]

{ #category : 'tests' }
MooseQueryTest >> testThroughAllFrom [
	self assert: method2 queryAllIncoming size equals: 3.
	self assert: class2 queryAllIncoming size equals: 7
]

{ #category : 'tests' }
MooseQueryTest >> testToScope [
	self assertCollection: (class1 toScope: FamixJavaMethod) hasSameElements: {method1}.
	self assertCollection: (class2 toScope: FamixJavaAttribute) hasSameElements: {var1 . var2}.
	self assertCollection: (class2 toScope: FamixTStructuralEntity) hasSameElements: {var1 . var2. localVariable}.
	self assertCollection: (package1 toScope: FamixJavaMethod) hasSameElements: {method1}
]

{ #category : 'tests' }
MooseQueryTest >> testWithAllContainedEntities [

	self assert: package2 withAllContainedEntities size equals: 7.
	self assert: class2 withAllContainedEntities size equals: 6.
	self assert: method2 withAllContainedEntities size equals: 2
]

{ #category : 'tests' }
MooseQueryTest >> testWithAllContainers [

	self assert: package2 withAllContainers size equals: 1.
	self assert: class2 withAllContainers size equals: 2.
	self assert: method2 withAllContainers size equals: 3.
	self assert: var2 withAllContainers size equals: 3
]

{ #category : 'tests' }
MooseQueryTest >> testWithProperty [

	self assertCollection: (class1 query containers withProperty: #hasSourceAnchor) hasSameElements: { class1 }.
	self assertCollection: (method1 query containers withProperty: #hasSourceAnchor) hasSameElements: { class1 }.
	self assertCollection: (class2 query containers withProperty: #hasSourceAnchor) hasSameElements: {  }.
	self assertCollection: (method2 query containers withProperty: #hasSourceAnchor) hasSameElements: {  }
]

{ #category : 'tests' }
MooseQueryTest >> testWithPropertyAsBlock [

	self assertCollection: (class1 query containers withProperty: [ :e | e hasSourceAnchor ]) hasSameElements: { class1 }.
	self assertCollection: (method1 query containers withProperty: [ :e | e hasSourceAnchor ]) hasSameElements: { class1 }.
	self assertCollection: (class2 query containers withProperty: [ :e | e hasSourceAnchor ]) hasSameElements: {  }.
	self assertCollection: (method2 query containers withProperty: [ :e | e hasSourceAnchor ]) hasSameElements: {  }
]

{ #category : 'tests' }
MooseQueryTest >> testWithPropertyAsBlockHandleError [

	self assertCollection: (class1 query containers withProperty: [ :e | e size ]) hasSameElements: {  }.
	self assertCollection: (method1 query containers withProperty: [ :e | e size ]) hasSameElements: {  }
]

{ #category : 'tests' }
MooseQueryTest >> testWithPropertyBlockReturnNotBoolean [

	self should: [ class1 query containers withProperty: [ :e | e numberOfMethods ] ] raise: MQScopeShouldBeSeclectedReturnNotBooleanValueError.
	self should: [ method1 query containers withProperty: [ :e | e numberOfMethods ] ] raise: MQScopeShouldBeSeclectedReturnNotBooleanValueError
]

{ #category : 'tests' }
MooseQueryTest >> testWithPropertyHandleError [

	self assertCollection: (class1 query containers withProperty: #hasBlaBla) hasSameElements: {  }
]

{ #category : 'tests' }
MooseQueryTest >> testWithPropertyOnlyUnderstandByParent [

	| interface1 methodInt1 |
	interface1 := FamixJavaInterface named: 'interface1'.
	methodInt1 := (FamixJavaMethod named: 'methodInt1') parentType: interface1.
	self assertCollection: (interface1 query containers withProperty: #isInterface) hasSameElements: { interface1 }.
	self assertCollection: (methodInt1 query containers withProperty: #isInterface) hasSameElements: { interface1 }.
	self assertCollection: (class2 query containers withProperty: #isInterface) hasSameElements: {  }.
	self assertCollection: (method2 query containers withProperty: #isInterface) hasSameElements: {  }
]

{ #category : 'tests' }
MooseQueryTest >> testWithPropertyReturnNotBoolean [

	self should: [ class1 query containers withProperty: #numberOfMethods ] raise: MQScopeShouldBeSeclectedReturnNotBooleanValueError.
	self should: [ method1 query containers withProperty: #numberOfMethods ] raise: MQScopeShouldBeSeclectedReturnNotBooleanValueError
]

{ #category : 'tests' }
MooseQueryTest >> testWithSpecializedAssociation [
	"The goal of this test is to check that MooseQuery is also able to query specialized associations."

	| invoSpecialized result |
	invoSpecialized := MooseQueryMockSpecializedInvocation new
		sender: method1;
		addCandidate: method2;
		receiver: var2;
		mooseModel: model.
	result := method1 query: #out with: MooseQueryMockSpecializedInvocation.
	self assert: result size equals: 1.
	self assert: result anyOne equals: invoSpecialized
]
