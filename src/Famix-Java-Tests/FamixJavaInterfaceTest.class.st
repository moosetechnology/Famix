Class {
	#name : #FamixJavaInterfaceTest,
	#superclass : #TestCase,
	#category : #'Famix-Java-Tests'
}

{ #category : #tests }
FamixJavaInterfaceTest >> testMultipleInheritance [

	| interface supInt1 supInt2 inh1 inh2 |
	
	interface := FamixJavaInterface new.
	supInt1 := FamixJavaInterface new.
	supInt2 := FamixJavaInterface new.
	inh1 := FamixJavaInheritance new.
	inh1 subclass: interface.
	inh1 superclass: supInt1.
	inh2 := FamixJavaInheritance new.
	inh2 subclass: interface.
	inh2 superclass: supInt2.
	
	self assertCollection: interface superInheritances hasSameElements: { inh1. inh2 }
	
]
