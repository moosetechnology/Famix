Class {
	#name : #FamixJavaAttributeTest,
	#superclass : #TestCase,
	#category : #'Famix-Java-Tests'
}

{ #category : #tests }
FamixJavaAttributeTest >> testAttributeVisibility [
	| attribute |
	attribute := FamixJavaAttribute new.
	self assert: attribute visibility isNil.
	attribute bePackage.
	self assert: attribute isPackage.
	attribute bePrivate.
	self assert: attribute isPrivate.
	self deny: attribute isPackage.
	attribute bePublic.
	self assert: attribute isPublic.
	self deny: attribute isPackage.
	self deny: attribute isPrivate.
	attribute beProtected.
	self assert: attribute isProtected.
	self deny: attribute isPackage.
	self deny: attribute isPrivate.
	self deny: attribute isPublic.
	
	
	
]
