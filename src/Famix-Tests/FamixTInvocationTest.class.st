Class {
	#name : #FamixTInvocationTest,
	#superclass : #TestCase,
	#instVars : [
		'invocation'
	],
	#category : #'Famix-Tests'
}

{ #category : #running }
FamixTInvocationTest >> setUp [

	super setUp.
	invocation := MooseEntity new
		              addTalent: FamixTInvocation;
		              yourself.

	invocation initialize
]

{ #category : #running }
FamixTInvocationTest >> testInvokedEntity [

	| function |
	function := MooseEntity new
		            addTalent: FamixTFunction;
		            initialize;
		            yourself.

	invocation addCandidate: function.

	self assert: invocation candidates size equals: 1.
	self assert: invocation invokedEntity equals: function
]

{ #category : #running }
FamixTInvocationTest >> testInvokedEntitySetter [

	| function |
	function := MooseEntity new
		            addTalent: FamixTFunction;
		            initialize;
		            yourself.

	invocation invokedEntity: function.

	self assert: invocation candidates size equals: 1.
	self assert: invocation invokedEntity equals: function
]

{ #category : #running }
FamixTInvocationTest >> testInvokedEntityWithMoreThan1Candidate [

	| function1 function2 |
	function1 := MooseEntity new
		             addTalent: FamixTFunction;
		             initialize;
		             yourself.

	function2 := MooseEntity new
		             addTalent: FamixTFunction;
		             initialize;
		             yourself.

	invocation
		addCandidate: function1;
		addCandidate: function2.

	self assert: invocation candidates size equals: 2.
	self should: [ invocation invokedEntity ] raise: Error
]

{ #category : #running }
FamixTInvocationTest >> testInvokedEntityWithNoCandidate [

	self assertEmpty: invocation candidates.
	self should: [ invocation invokedEntity ] raise: Error
]
