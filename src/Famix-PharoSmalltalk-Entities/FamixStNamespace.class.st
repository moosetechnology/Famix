"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
| `globalVariables` | `FamixTWithGlobalVariables` | `parentScope` | `FamixTGlobalVariable` | Global variables defined in the scope, if any.|
| `types` | `FamixTWithTypes` | `typeContainer` | `FamixTType` | Types contained (declared) in this entity, if any.
#types is declared in ContainerEntity because different kinds of container can embed types. Types are usually contained in a Famix.Namespace. But types can also be contained in a Famix.Class or Famix.Method (in Java with inner classes for example). Famix.Function can also contain some types such as structs.|

### Other
| Relation | Origin | Opposite | Type | Comment |
| `receivingInvocations` | `FamixTInvocationsReceiver` | `receiver` | `FamixTInvocation` | List of invocations performed on this entity (considered as the receiver)|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Class {
	#name : #FamixStNamespace,
	#superclass : #FamixStNamedEntity,
	#traits : 'FamixTInvocationsReceiver + FamixTNamespace + FamixTWithClasses + FamixTWithGlobalVariables',
	#classTraits : 'FamixTInvocationsReceiver classTrait + FamixTNamespace classTrait + FamixTWithClasses classTrait + FamixTWithGlobalVariables classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStNamespace class >> annotation [

	<FMClass: #Namespace super: #FamixStNamedEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^ self
]

{ #category : #'Famix-Extensions-metrics' }
FamixStNamespace >> abstractness [
	"Abstractness is the ratio between the number of abstract classes and the total number of classes in a package, in the range [0, 1]. 0 means the package is fully concrete, 1 it is fully abstract."
	<FMProperty: #abstractness type: #Number>
	<derived>
	<FMComment: 'Abstractness of a package'>

	| nsClasses |
	nsClasses := self allClasses select: [:c | c isInstanceSide].
	(nsClasses size == 0) ifTrue: [^nil].
	
	^ (nsClasses select: [:c | c isAbstract]) size / (nsClasses size)
]

{ #category : #accessing }
FamixStNamespace >> allClasses [
	| result |
	result := OrderedCollection new.
	self withAllChildScopesDo: [ :each | result addAll: each classes ].
	^ result
]

{ #category : #'Famix-Extensions-nav All Dependencies' }
FamixStNamespace >> mooseNameOn: aStream [ 
	| parent |
	parent := self belongsTo.
	parent ifNotNil: 
		[ parent mooseNameOn: aStream.
		aStream
			nextPut: $:;
			nextPut: $: ].
	self name ifNotNil: [aStream nextPutAll: self name]
]

{ #category : #'Famix-Extensions' }
FamixStNamespace >> numberOfClasses: aNumber [
	self cacheAt: #numberOfClasses put: aNumber
]

{ #category : #'Famix-Extensions' }
FamixStNamespace >> numberOfMethods [
	<FMProperty: #numberOfMethods type: #Number>
	<derived>
	<FMComment: 'The number of methods in a namespace'>
	
	^self
		lookUpPropertyNamed: #numberOfMethods
		computedAs: [self types inject: 0 into: [ :sum :each | sum + each numberOfMethods ]]
]

{ #category : #'Famix-Extensions' }
FamixStNamespace >> numberOfMethods: aNumber [
	self cacheAt: #numberOfMethods put: aNumber
]
