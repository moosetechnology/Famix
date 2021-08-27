Class {
	#name : #MooseQueryComparedToMooseQueryTest,
	#superclass : #MooseQueryTest,
	#category : #'Moose-Query-Test'
}

{ #category : #tests }
MooseQueryComparedToMooseQueryTest >> testIncomingAccesses [
	self
		assert: (package2 queryIncoming: FamixTAccess) asSet
		equals: (MooseIncomingQueryResult on: package2 withAll: (package2 classes flatCollect: [ :c | c queryIncomingAccesses ])) asSet.
	self
		assert: (package1 queryIncoming: FamixTAccess) asSet
		equals: (MooseIncomingQueryResult on: package1 withAll: (package1 classes flatCollect: [ :c | c queryIncomingAccesses ])) asSet.
	self
		assert: (class2 queryIncoming: FamixTAccess) asSet
		equals: (MooseIncomingQueryResult on: class2 withAll: (class2 attributes flatCollect: [ :each | each incomingAccesses ])) asSet.
	self
		assert: (method2 queryIncoming: FamixJavaAccess) asSet
		equals:
			(MooseIncomingQueryResult
				on: method2
				withAll:
					((method2 parameters flatCollect: #incomingAccesses) asOrderedCollection
						addAll: (method2 localVariables flatCollect: #incomingAccesses);
						yourself)) asSet.
	self assert: (localVariable queryIncoming: FamixJavaAccess) asSet equals: localVariable incomingAccesses asSet
]

{ #category : #tests }
MooseQueryComparedToMooseQueryTest >> testIncomingInheritances [
	self assert: (class2 queryIncoming: FamixTInheritance) asSet equals: (MooseIncomingQueryResult on: class2 withAll: class2 subInheritances) asSet.
	self
		assert: (package2 queryIncoming: FamixTInheritance) asSet
		equals: (MooseIncomingQueryResult on: package2 withAll: (package2 classes flatCollect: [ :c | c subInheritances ])) asSet.
	self
		assert: (package1 queryIncoming: FamixTInheritance) asSet
		equals: (MooseIncomingQueryResult on: package1 withAll: (package1 classes flatCollect: [ :c | c subInheritances ])) asSet.
	self assert: (method2 queryIncoming: FamixTInheritance) asSet equals: Array empty asSet
]

{ #category : #tests }
MooseQueryComparedToMooseQueryTest >> testIncomingInvocations [
	"queryIncoming: is equivalent to query: #in with:"

	self assert: (method2 queryIncoming: FamixTInvocation) asSet equals: (MooseIncomingQueryResult on: method2 withAll: method2 incomingInvocations) asSet.
	self
		assert: (class2 queryIncoming: FamixTInvocation) asSet
		equals: (MooseIncomingQueryResult on: class2 withAll: (class2 methods flatCollect: [ :m | m incomingInvocations ])) asSet.
	self
		assert: (package2 queryIncoming: FamixTInvocation) asSet
		equals: (MooseIncomingQueryResult on: package2 withAll: (package2 methods flatCollect: [ :m | m incomingInvocations ])) asSet.
	self
		assert: (package1 queryIncoming: FamixTInvocation) asSet
		equals: (MooseIncomingQueryResult on: package1 withAll: ((package1 toScope: FamixTMethod) flatCollect: [ :c | c incomingInvocations ])) asSet
]

{ #category : #tests }
MooseQueryComparedToMooseQueryTest >> testIncomingReferences [
	self
		assert: (package2 queryIncoming: FamixTReference) asSet
		equals: (MooseIncomingQueryResult on: package2 withAll: (package2 classes flatCollect: [ :c | c incomingReferences ])) asSet.

	self
		assert: (package1 queryIncoming: FamixTReference) asSet
		equals: (MooseIncomingQueryResult on: package1 withAll: (package1 classes flatCollect: [ :c | c incomingReferences ])) asSet.

	self assert: (class2 queryIncoming: FamixTReference) asSet equals: (MooseIncomingQueryResult on: class2 withAll: class2 incomingReferences) asSet.

	self assert: (method2 queryIncoming: FamixTReference) asSet equals: (MooseIncomingQueryResult on: method2 withAll: Set new) asSet
]

{ #category : #tests }
MooseQueryComparedToMooseQueryTest >> testOutgoingAccesses [
	self
		assert: (package2 queryOutgoing: FamixTAccess) asSet
		equals: (MooseOutgoingQueryResult on: package2 withAll: (package2 methods flatCollect: [ :m | m accesses ])) asSet.
	self
		assert: (package1 queryOutgoing: FamixTAccess) asSet
		equals: (MooseOutgoingQueryResult on: package1 withAll: ((package1 toScope: FamixTMethod) flatCollect: [ :m | m accesses ])) asSet.
	self
		assert: (class2 queryOutgoing: FamixTAccess) asSet
		equals: (MooseOutgoingQueryResult on: class2 withAll: (class2 methods flatCollect: [ :m | m accesses ])) asSet.
	self assert: (method2 queryOutgoing: FamixTAccess) asSet equals: (MooseOutgoingQueryResult on: method2 withAll: method2 accesses) asSet
]

{ #category : #tests }
MooseQueryComparedToMooseQueryTest >> testOutgoingInheritances [
	self assert: (class1 queryOutgoing: FamixTInheritance) asSet equals: (MooseOutgoingQueryResult on: class1 withAll: class1 superInheritances) asSet.
	self
		assert: (package1 queryOutgoing: FamixTInheritance) asSet
		equals: (MooseOutgoingQueryResult on: package1 withAll: (package1 classes flatCollect: [ :c | c superInheritances ])) asSet.
	self assert: (method2 queryOutgoing: FamixTInheritance) asSet equals: Array empty asSet
]

{ #category : #tests }
MooseQueryComparedToMooseQueryTest >> testOutgoingInvocations [
	self assert: (method2 queryOutgoing: FamixTInvocation) asSet equals: (MooseOutgoingQueryResult on: method2 withAll: method2 outgoingInvocations) asSet.
	self
		assert: (class2 queryOutgoing: FamixTInvocation) asSet
		equals: (MooseOutgoingQueryResult on: class2 withAll: (class2 methods flatCollect: [ :m | m outgoingInvocations ])) asSet.
	self
		assert: (package2 queryOutgoing: FamixTInvocation) asSet
		equals: (MooseOutgoingQueryResult on: package2 withAll: (package2 methods flatCollect: [ :m | m outgoingInvocations ])) asSet.
	self
		assert: (package1 queryOutgoing: FamixTInvocation) asSet
		equals: (MooseOutgoingQueryResult on: package1 withAll: ((package1 toScope: FamixTMethod) flatCollect: [ :c | c outgoingInvocations ])) asSet
]

{ #category : #tests }
MooseQueryComparedToMooseQueryTest >> testOutgoingReferences [
	self
		assert: (package1 queryOutgoing: FamixTReference) asSet
		equals: (MooseOutgoingQueryResult on: package1 withAll: (package1 methods flatCollect: [ :m | m outgoingReferences ])) asSet.
	self
		assert: (class1 queryOutgoing: FamixTReference) asSet
		equals: (MooseOutgoingQueryResult on: class1 withAll: (class1 methods flatCollect: [ :m | m outgoingReferences ])) asSet.
	self assert: (method1 queryOutgoing: FamixTReference) asSet equals: (MooseOutgoingQueryResult on: method1 withAll: method1 outgoingReferences) asSet
]
