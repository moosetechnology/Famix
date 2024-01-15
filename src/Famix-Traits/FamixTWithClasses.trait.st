"
## Relations
======================

### Children
- Relation: #types Type: #FamixTType Opposite: #typeContainer Comment: Types contained (declared) in this entity, if any.
#types is declared in ContainerEntity because different kinds of container can embed types. Types are usually contained in a Famix.Namespace. But types can also be contained in a Famix.Class or Famix.Method (in Java with inner classes for example). Famix.Function can also contain some types such as structs.


"
Trait {
	#name : #FamixTWithClasses,
	#traits : 'FamixTWithTypes',
	#classTraits : 'FamixTWithTypes classTrait',
	#category : #'Famix-Traits-Class'
}

{ #category : #meta }
FamixTWithClasses classSide >> annotation [

	<FMClass: #TWithClasses super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixTWithClasses >> classes [
	"Classes are usually seen as types from the point of view of a Container. However, there may other types (e.g. aspects) which we dont want to see as classes and are rejected by this method."

	<navigation: 'Classes'>
	^ self cacheAt: #classes ifAbsentPut: [ self types select: #isClass ]
]

{ #category : #accessing }
FamixTWithClasses >> numberOfClasses [
	<FMProperty: #numberOfClasses type: #Number>
	<derived>
	<FMComment: 'The number of classes in a package'>
	^ self classes size
]
