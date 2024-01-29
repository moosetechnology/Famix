"
I can contain interfaces (Packages, Methods, Classes...)

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `types` | `FamixTWithTypes` | `typeContainer` | `FamixTType` | Types contained (declared) in this entity, if any.
#types is declared in ContainerEntity because different kinds of container can embed types. Types are usually contained in a Famix.Namespace. But types can also be contained in a Famix.Class or Famix.Method (in Java with inner classes for example). Famix.Function can also contain some types such as structs.|



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

{ #category : #accessing }
FamixJavaTWithInterfaces >> containedInterfaces [
	"Classes are usually seen as types from the point of view of a Container. However, there may other types (e.g. aspects) which we dont want to see as classes and are rejected by this method."

	<navigation: 'Contained Interfaces'>
	^ self
		  cacheAt: #containedInterfaces 
		  ifAbsentPut: [ self types select: #isInterface ]
]

{ #category : #accessing }
FamixJavaTWithInterfaces >> interfaces [
	"Classes are usually seen as types from the point of view of a Container. However, there may other types (e.g. aspects) which we dont want to see as classes and are rejected by this method."

	self
		deprecated:
		'The name of this method is ambiguous when in a class: does it return the contained interfaces or the implemented interfaces?'
		transformWith:
		'`@receiver interfaces' -> '`@receiver containedInterfaces'.
	^ self containedInterfaces
]
