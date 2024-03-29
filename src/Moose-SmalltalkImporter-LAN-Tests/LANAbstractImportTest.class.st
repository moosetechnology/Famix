Class {
	#name : #LANAbstractImportTest,
	#superclass : #TestCase,
	#category : #'Moose-SmalltalkImporter-LAN-Tests'
}

{ #category : #resources }
LANAbstractImportTest class >> resources [
	^ Array with: LANPackageTestResource
]

{ #category : #private }
LANAbstractImportTest >> model [
	" to debug and avoid caching behavior: LANPackageTestResource reset."
	^ LANPackageTestResource current model
]

{ #category : #tests }
LANAbstractImportTest >> testClasses [

	self model metamodel.
	self denyEmpty: (self model allUsing: FamixTClass)
]

{ #category : #private }
LANAbstractImportTest >> totalNumberOfAttributesFor: aClass [

	^ aClass allInstVarNames size + aClass allClassVarNames size
]
