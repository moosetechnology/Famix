"
A CPPSMethodTest is a test class for testing the behavior of CPPSMethod
"
Class {
	#name : #CppMethodTest,
	#superclass : #TestCase,
	#category : #'Cpp-Entities-Tests-Entities'
}

{ #category : #tests }
CppMethodTest >> testIsConstructor [
	| meth1 meth2 |
	meth1 := CppMethod named: 'TestConstructor'.
	meth1 parentType: (CppType named: 'TestConstructor').
	meth2 := CppMethod named: 'testNotConstructor'.
	meth2 parentType: (CppType named: 'aClass').

	self assert: meth1 isConstructor.
	self deny: meth2 isConstructor
]

{ #category : #tests }
CppMethodTest >> testIsDestructor [
	| meth1 meth2 |
	meth1 := CppMethod named: '~TestDestructor'.
	meth1 parentType: (CppType named: 'TestDestructor').
	meth2 := CppMethod named: 'testNotDestructor'.
	meth2 parentType: (CppType named: 'aClass').

	self assert: meth1 isDestructor.
	self deny: meth2 isDestructor
]
