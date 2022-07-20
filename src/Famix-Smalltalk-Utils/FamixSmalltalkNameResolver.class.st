Class {
	#name : #FamixSmalltalkNameResolver,
	#superclass : #Object,
	#category : #'Famix-Smalltalk-Utils'
}

{ #category : #'naming conventions' }
FamixSmalltalkNameResolver class >> famixNamespaceSeparator [
	^ '::'
]

{ #category : #'getting classes' }
FamixSmalltalkNameResolver class >> findClassNamedOrNilFromFullName: stClassFullNameSymbol [
	"returns the class whose name is aClassFullNameSymbol. 
	aClassFullNameSymbol should smalltalk and not moose related.and should not represent a metaclass"

	^ self class environment at: stClassFullNameSymbol asSymbol ifAbsent: [ nil ]
]

{ #category : #private }
FamixSmalltalkNameResolver class >> metaclassTag [
	"The meta class tag used in FAMIX2."

	^ '_class'
]

{ #category : #'naming conventions' }
FamixSmalltalkNameResolver class >> moosify: aString [
	^ aString copyReplaceAll: self smalltalkNamespaceSeparator with: self famixNamespaceSeparator
]

{ #category : #naming }
FamixSmalltalkNameResolver class >> signatureFromSmalltalkSelectorOn: aName [
	"self signatureFromSmalltalkSelector: #new"

	"self signatureFromSmalltalkSelector: #new:"

	"self signatureFromSmalltalkSelector: #with:with:"

	"self signatureFromSmalltalkSelector: #with:with:with:"

	"self signatureFromSmalltalkSelector: #'+'"

	| sym ws numArgs |
	sym := aName asSymbol.
	numArgs := sym numArgs.
	ws := WriteStream on: (String new: sym size + (numArgs * 7) + 3).
	ws
		nextPutAll: sym;
		nextPut: $(.
	1 to: numArgs do: [ :inx | ws nextPutAll: 'Object,' ].
	numArgs > 0 ifTrue: [ ws skip: -1	"remove last space" ].
	ws nextPut: $).
	^ ws contents asSymbol
]

{ #category : #'naming conventions' }
FamixSmalltalkNameResolver class >> smalltalkClassFromFamixClassName: aFamixStName ifAbsent: aBlock [

	"Given the FamixSt name of a class (meta class or not): return that Smalltalk class."

	| stName isMeta newName |
	stName := self smalltalkClassNameFromFamixClassName: aFamixStName.
	isMeta := '*' , self stMetaclassTag match: stName.
	newName := isMeta
		           ifTrue: [ 
		           stName
			           copyFrom: 1
			           to: stName size - self stMetaclassTag size ]
		           ifFalse: [ stName ].
	^ (self findClassNamedOrNilFromFullName: newName)
		  ifNil: [ aBlock value ]
		  ifNotNil: [ :res | 
			  isMeta
				  ifTrue: [ res class ]
				  ifFalse: [ res ] ]
]

{ #category : #'naming conventions' }
FamixSmalltalkNameResolver class >> smalltalkClassNameFromFamixClassName: aFamixStName [

	"Given the FamixSt name of a class (meta class or not): return the Smalltalk name."

	| isMetaclass index |
	isMetaclass := '*' , self metaclassTag match: aFamixStName.

	"We check whether there is a reference to a namespace in the famix name"
	index := aFamixStName findString: self famixNamespaceSeparator.
	index := index isZero
		         ifTrue: [ 1 ]
		         ifFalse: [ 
			         (aFamixStName findString: self famixNamespaceSeparator)
			         + self famixNamespaceSeparator size ].
	^ isMetaclass
		  ifTrue: [ 
			  ((aFamixStName
				    copyFrom: index
				    to: (aFamixStName findString: self metaclassTag) - 1)
			   , ' class') asSymbol ]
		  ifFalse: [ 
		  (aFamixStName copyFrom: index to: aFamixStName size) asSymbol ]
]

{ #category : #'naming conventions' }
FamixSmalltalkNameResolver class >> smalltalkNamespaceSeparator [
	^ '.'
]

{ #category : #private }
FamixSmalltalkNameResolver class >> stMetaclassTag [
	"The meta class tag used in SmalltLK."

	^ ' class'
]
