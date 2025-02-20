"
Takes 2 models (resource and consumer) and replace stub entities in the consumerModel by their non-stub equivalent in the resourceModel

For all stub entities in consumerModel, looks for a non-stub entity with same mooseName in resourceModel.
If one is found, replace all references to the stub entity in consumerModel by references to the corresponding non-stub entity in resourceModel.
The result is that both models depend on one another ""as one model"".
Yet they are not one model, so some behavior (like exporting) might produce unexpected results.

Use:
```
FamixFusionnerJava new
	resourceModel: <resourceModel> ;
	consumerModel: <consumerModel> ;
	fusion
```

Not: This is not a real visitor, it uses trait `FamixJavaVisitor` for the double-dispatch facility, but the visit should be constrainted to just one entity
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
	#category : #'Famix-Java-Fusionner'
}

{ #category : #'visiting - traits' }
FamixFusionnerJava >> acceptMeIfNotNil: aFamixEntity [
	"This is not a real visitor, the #accept: methods are used for double-dispatch
	 so no visting of entities relations"

	"^aFamixEntity ifNil: [ nil ] ifNotNil: [ aFamixEntity accept: self ]"

]

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
			(resource isStub not and: [resource class = stub class])
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

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTAccessible: aFamixTAccessible [
	"#visitList: does not do anything, so must reimplement it here"

	"self visitList: aFamixTAccessible incomingAccesses."
	aFamixTAccessible incomingAccesses copy 
		do: [ :access | access accept: self ]

	
]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTAssociation: aFamixTAssociation [
	"Note 1: we arrived here while visiting the (stub) target entity
	 Note 2: association don't have the #isStub property, but if the #source is a stub, then the association is
	 In that case, it should be removed from the consumerModel because it must exist in the resourceModel
	 And if we remove it, we should 'unlink' it from both entities in case they are visited again later
	 (might happen for inheritance of FamixJavaExceptions)"

	aFamixTAssociation source isStub
		ifTrue: [
			aFamixTAssociation source: nil.
			aFamixTAssociation target: nil.
			consumerModel remove: aFamixTAssociation
		]
		ifFalse: [ aFamixTAssociation target: resourceEntity ]
]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTInvocable: aFamixTInvocable [
	"similar to #visitFamixTAssociation:
	 but the #target of the invocation is a collection
	 see also #visitFamixTInvocationReceiver:"

	
	aFamixTInvocable incomingInvocations copy do: [ :invocation |
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
	"Should not be called, Invocations are treated in #visitFamixTInvocable: and #visitFamixTInvocationsReceiver:"

	self shouldNotImplement 
]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTInvocationsReceiver: aFamixTInvocationsReceiver [
	"similar to #visitFamixTAssociation:
	 but invocation receiver is not #target of the association
	 see also #visitFamixTInvocable:"

	
	aFamixTInvocationsReceiver receivingInvocations copy do: [ :invocation |
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
FamixFusionnerJava >> visitFamixTReferenceable: aFamixTReferenceable [
	"#visitList: does not do anything, so must reimplement it here"

	"self visitList: aFamixTReferenceable incomingReferences."
	aFamixTReferenceable incomingReferences copy 
		do: [ :reference | reference accept: self ]

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTThrowable: aFamixTThrowable [
	
	aFamixTThrowable catchingEntities copy do: [ :catchingEntity |
		catchingEntity isStub
			ifFalse: [
				catchingEntity caughtExceptions remove: aFamixTThrowable.
				catchingEntity addCaughtException: resourceEntity.
			]
	].

	aFamixTThrowable declaringEntities copy do: [ :declaringEntity |
		declaringEntity isStub
			ifFalse: [
				declaringEntity declaredExceptions remove: aFamixTThrowable.
				declaringEntity addDeclaredException: resourceEntity.
			]
	].

	aFamixTThrowable throwingEntities copy do: [ :throwingEntity |
		throwingEntity isStub
			ifFalse: [
				throwingEntity thrownExceptions remove: aFamixTThrowable.
				throwingEntity addThrownException: resourceEntity.
			]
	].

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTType: aFamixTType [
	"replace aFamixTType by resourceEntity
	 no need for the rest"

	self visitFamixTCanBeStub: aFamixTType.
	self visitFamixTNamedEntity: aFamixTType.
	self visitFamixTReferenceable: aFamixTType.
	self visitTEntityMetaLevelDependency: aFamixTType.
	self acceptMeIfNotNil: aFamixTType typeContainer.
	"self visitList: aFamixTType typedEntities."

	aFamixTType typedEntities copy 
		do: [ :typedEntity | typedEntity declaredType: resourceEntity ]

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTWithInheritances: aFamixTWithInheritances [

	"self visitList: aFamixTWithInheritances superInheritances.
	self visitList: aFamixTWithInheritances subInheritances."

	aFamixTWithInheritances subInheritances copy
		do: [ :inheritance | self visitFamixTAssociation: inheritance ]

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitList: aCollection [
	"This is not a real visitor, the #accept: methods are used for double-dispatch
	 so no visting of entities relations"

	"^aCollection collect: [ :each | each accept: self ]"

]
