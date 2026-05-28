Class {
	#name : 'FmxMBTypedPropertyTest',
	#superclass : 'FmxMBPropertyTest',
	#category : 'Famix-MetamodelBuilder-Tests-Tests',
	#package : 'Famix-MetamodelBuilder-Tests',
	#tag : 'Tests'
}

{ #category : 'tests' }
FmxMBTypedPropertyTest >> testMultivalued [

	"test if typed properties can be multivalued"

	| aClass simpleProperty multivaluedProperty |
	
	aClass := builder newClassNamed: #SomeClass.
	simpleProperty := (aClass property: #simple type: #Object).
	multivaluedProperty := (aClass property: #multi type: #Object) multivalued.

	self deny: simpleProperty isMultivalued.
	self assert: multivaluedProperty isMultivalued.
	
	"swap and test again"

	simpleProperty multivalued: true.
	multivaluedProperty multivalued: false.	

	self assert: simpleProperty isMultivalued.
	self deny: multivaluedProperty isMultivalued.

]
