"
I can contain interfaces (Packages, Methods, Classes...)
"
Trait {
	#name : #FamixJavaTWithInterfaces,
	#traits : 'FamixTWithTypes',
	#classTraits : 'FamixTWithTypes classTrait',
	#category : #'Famix-Java-Entities-Traits'
}

{ #category : #meta }
FamixJavaTWithInterfaces classSide >> annotation [

	<FMClass: #TWithInterfaces super: #Object>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #'as yet unclassified' }
FamixJavaTWithInterfaces >> containedInterfaces [
	"Classes are usually seen as types from the point of view of a Container. However, there may other types (e.g. aspects) which we dont want to see as classes and are rejected by this method."

	<navigation: 'Interfaces'>
	^ self
		  cacheAt: #interfaces
		  ifAbsentPut: [ self types select: #isInterface ]
]

{ #category : #'as yet unclassified' }
FamixJavaTWithInterfaces >> interfaces [
	"Classes are usually seen as types from the point of view of a Container. However, there may other types (e.g. aspects) which we dont want to see as classes and are rejected by this method."

	self
		deprecated:
		'The name of this method is ambiguous when in a class: does it return the contained interfaces or the implemented interfaces?'
		transformWith:
		'`@receiver interfaces' -> '`@receiver containedInterfaces'.
	^ self containedInterfaces
]
