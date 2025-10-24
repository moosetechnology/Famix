Class {
	#name : 'FamixTImplementableTest',
	#superclass : 'TestCase',
	#instVars : [
		'implementable'
	],
	#category : 'Famix-Tests',
	#package : 'Famix-Tests'
}

{ #category : 'running' }
FamixTImplementableTest >> setUp [

	super setUp.
	implementable := MooseEntity new
		                 addTalent: FamixTImplementable;
		                 yourself.

	implementable initialize
]

{ #category : 'tests' }
FamixTImplementableTest >> testImplementors [

	| class1 class2 implementation1 implementation2 |
	class1 := MooseEntity new
		          addTalent: FamixTCanImplement;
		          yourself.
	class2 := MooseEntity new
		          addTalent: FamixTCanImplement;
		          yourself.


	implementation1 := MooseEntity new
		                   addTalent: FamixTImplementation;
		                   yourself.
	implementation2 := MooseEntity new
		                   addTalent: FamixTImplementation;
		                   yourself.

	{
		class1.
		class2.
		implementation1.
		implementation2 } do: #initialize.

	implementation1 interface: implementable.
	implementation2 interface: implementable.
	implementation1 implementingClass: class1.
	implementation2 implementingClass: class2.

	self assertCollection: implementable implementors hasSameElements: {
			class1.
			class2 }
]
