Class {
	#name : #FamixJavaInterfaceTest,
	#superclass : #TestCase,
	#category : #'Famix-Java-Tests'
}

{ #category : #tests }
FamixJavaInterfaceTest >> testClassContainInterface [

	| interface class |
	interface := FamixJavaInterface new.
	class := FamixJavaClass new.
	class addInterface: interface. 


	self
		assertCollection: class interfaces
		hasSameElements: { interface }.

]

{ #category : #tests }
FamixJavaInterfaceTest >> testImplementation [


	
	| interface class impl |
	interface := FamixJavaInterface new.
	class := FamixJavaClass new.
	impl := FamixJavaImplementation new.
	impl interface: interface.
	impl implementingClass: class.

	
	self assertCollection: interface implementations hasSameElements: { impl }.
	self assertCollection: class interfaceImplementations hasSameElements: { impl }.
	
]

{ #category : #tests }
FamixJavaInterfaceTest >> testInterfaceContainInterface [

	| interface int2 |
	interface := FamixJavaInterface new.
	int2 := FamixJavaInterface new.
	int2 addInterface: interface. 


	self
		assertCollection: int2 interfaces
		hasSameElements: { interface }.
]

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
