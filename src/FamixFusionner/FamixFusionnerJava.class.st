Class {
	#name : #FamixFusionnerJava,
	#superclass : #Object,
	#traits : 'FamixJavaVisitor',
	#classTraits : 'FamixJavaVisitor classTrait',
	#instVars : [
		'resourceModel',
		'consumerModel',
		'resourceEntity'
	],
	#category : #FamixFusionner
}

{ #category : #accessing }
FamixFusionnerJava >> consumerModel [

	^ consumerModel
]

{ #category : #accessing }
FamixFusionnerJava >> consumerModel: anObject [

	consumerModel := anObject
]

{ #category : #api }
FamixFusionnerJava >> findResource: stub [

	^resourceModel
		entityNamed: stub mooseName
		ifAbsent: [ nil ]
		ifPresent: [ :resource |
			(resource class = stub class)
				ifTrue: [ resource ]
				ifFalse: [ nil ]
		]
]

{ #category : #api }
FamixFusionnerJava >> fusion [

	self fusionStubs: (consumerModel select: #isStub).
]

{ #category : #api }
FamixFusionnerJava >> fusionStubs: aCollection [

	aCollection copy do: [ :stub |
		(self findResource: stub)
			ifNotNil: [ :resource | self replace: stub by: resource ]
	]
]

{ #category : #api }
FamixFusionnerJava >> replace: stub by: resource [
	"make everything pointing to stub (in consumerModel) now pointing to resource (in resourceModel)
	 using the double-dispatch mechanism for this
	 then remove sub from its model"

	resourceEntity := resource.
	stub accept: self.

	consumerModel remove: stub
]

{ #category : #accessing }
FamixFusionnerJava >> resourceModel [

	^ resourceModel
]

{ #category : #accessing }
FamixFusionnerJava >> resourceModel: anObject [

	resourceModel := anObject
]

{ #category : #visiting }
FamixFusionnerJava >> visitClass: aFamixJavaClass [

	self visitFamixTClassMetrics: aFamixJavaClass.
	self visitFamixTCanBeAbstract: aFamixJavaClass.
	self visitFamixTCanBeClassSide: aFamixJavaClass.
	self visitFamixTCanBeFinal: aFamixJavaClass.
	self visitFamixTCanImplement: aFamixJavaClass.
	self visitFamixTClass: aFamixJavaClass.
	self visitFamixTClassMetrics: aFamixJavaClass.
	self visitFamixTHasVisibility: aFamixJavaClass.
	self visitFamixTImportable: aFamixJavaClass.
	self visitFamixTLCOMMetrics: aFamixJavaClass.
	self visitFamixTPackageable: aFamixJavaClass.
	self visitFamixTWithImports: aFamixJavaClass.

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTType: aFamixTType [
	<generated>
	self visitFamixTCanBeStub: aFamixTType.
	self visitFamixTNamedEntity: aFamixTType.
	self visitFamixTReferenceable: aFamixTType.
	self visitFamixTEntityMetaLevelDependency: aFamixTType.

	aFamixTType typedEntities do: [ :typedEntity |
		typedEntity declaredType: resourceEntity 
	]

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTWithInheritances: aFamixTWithInheritances [

	aFamixTWithInheritances subInheritances do: [ :inheritance |
		inheritance superclass: resourceEntity
	]

]
