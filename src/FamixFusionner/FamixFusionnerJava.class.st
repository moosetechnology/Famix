"
Takes 2 models (resource and consumer) and replace stub entities in the consumerModel by their non-stub equivalent in the resourceModel

For all stub entities in consumerModel, looks for a non-stub entity with same mooseName in resourceModel.
If one is found, replace all references to the stub entity in consumerModel by references to te corresponding non-stub entity in resourceModel.
The result is that both models depend on one another ""as one model"".
Yet they are not one model so some behavior (like exporting) might produce unespected results.

Use:
```
FamixFusionnerJava new
	resourceModel: <resourceModel> ;
	consumerModel: <consumerModel> ;
	fusion
```


"
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
FamixFusionnerJava >> visitFamixJavaType: aFamixJavaType [

	self visitFamixJavaTBound: aFamixJavaType.
	self visitFamixTConcreteParameterType: aFamixJavaType.
	"self visitFamixTWithMethods: aFamixJavaType.
	self visitFamixJavaContainerEntity: aFamixJavaType."

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTAssociation: aFamixTAssociation [
	"Note 1: we arrived here while visiting the (stub) target entity
	 Note 2: association don't have the #isStub property, but if the #source is a stub, then the association is
	 In that case, it should be removed from the consumerModel because it must exist in the resourceModel"

	aFamixTAssociation source isStub
		ifTrue: [ consumerModel remove: aFamixTAssociation ]
		ifFalse: [ aFamixTAssociation target: resourceEntity ]
]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTClass: aFamixTClass [

	self visitFamixTInvocationsReceiver: aFamixTClass.
	self visitFamixTType: aFamixTClass.
	"self visitFamixTWithAttributes: aFamixTClass.
	self visitFamixTWithComments: aFamixTClass."
	self visitFamixTWithInheritances: aFamixTClass.
	"self visitFamixTWithMethods: aFamixTClass."

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTInvocable: aFamixTInvocable [
	"similar to #visitFamixTAssociation:
	 but the #target of the invocation is a collection
	 see also #visitFamixTInvocationReceiver:"

	
	aFamixTInvocable incomingInvocations do: [ :invocation |
		invocation sender isStub
			ifTrue: [ consumerModel remove: invocation ]
			ifFalse: [
				invocation candidates remove: aFamixTInvocable.
				invocation addCandidate: resourceEntity
			]
	]

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTInvocation: aFamixTInvocation [
	"Should not be called, Invocations must be treated in #visitFamixTInvocable: and #visitFamixTInvocationsReceiver:"

	self shouldNotImplement 
]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTInvocationsReceiver: aFamixTInvocationsReceiver [
	"similar to #visitFamixTAssociation:
	 but invocation receiver is not #target of the association
	 see also #visitFamixTInvocable:"

	
	aFamixTInvocationsReceiver receivingInvocations do: [ :invocation |
		invocation sender isStub
			ifTrue: [ consumerModel remove: invocation ]
			ifFalse: [ invocation receiver: resourceEntity ]
	]

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTMethod: aFamixTMethod [

	"self visitFamixTHasSignature: aFamixTMethod."
	self visitFamixTInvocable: aFamixTMethod.
	"self visitFamixTMethodMetrics: aFamixTMethod.
	self visitFamixTNamedEntity: aFamixTMethod."
	self visitFamixTTypedEntity: aFamixTMethod.
	"self visitFamixTWithImplicitVariables: aFamixTMethod.
	self visitFamixTWithLocalVariables: aFamixTMethod.
	self visitFamixTWithParameters: aFamixTMethod."
	self visitFamixTWithStatements: aFamixTMethod.
	"self visitTEntityMetaLevelDependency: aFamixTMethod.
	self acceptMeIfNotNil: aFamixTMethod parentType."

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTPackageable: aFamixTPackageable [

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTType: aFamixTType [

	self visitFamixTReferenceable: aFamixTType.

	aFamixTType typedEntities do: [ :typedEntity |
		typedEntity declaredType: resourceEntity 
	]

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTWithInheritances: aFamixTWithInheritances [
	"default implementation visits superInheritances, but we need subInheritances"

	aFamixTWithInheritances subInheritances do: [ :inheritance | self visitFamixTAssociation: inheritance ]

]
