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

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTAccess: aFamixTAccess [

	self visitFamixTAssociation: aFamixTAccess.
	"self acceptMeIfNotNil: aFamixTAccess accessor.
	self acceptMeIfNotNil: aFamixTAccess variable."

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTAnnotationInstanceAttribute: aFamixTAnnotationInstanceAttribute [

	self visitTEntityMetaLevelDependency: aFamixTAnnotationInstanceAttribute.
	"self acceptMeIfNotNil: aFamixTAnnotationInstanceAttribute parentAnnotationInstance."

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
FamixFusionnerJava >> visitFamixTAttribute: aFamixTAttribute [

	self visitFamixTStructuralEntity: aFamixTAttribute.
	"self acceptMeIfNotNil: aFamixTAttribute parentType."

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTCompilationUnit: aFamixTCompilationUnit [

	self visitFamixTFile: aFamixTCompilationUnit.
	"self acceptMeIfNotNil: aFamixTCompilationUnit compilationUnitOwner."

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTDefinedInModule: aFamixTDefinedInModule [

	"self acceptMeIfNotNil: aFamixTDefinedInModule parentModule."

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTImplementation: aFamixTImplementation [

	self visitFamixTAssociation: aFamixTImplementation.
	"self acceptMeIfNotNil: aFamixTImplementation implementingClass.
	self acceptMeIfNotNil: aFamixTImplementation interface."

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
	"Should not be called, Invocations are treated in #visitFamixTInvocable: and #visitFamixTInvocationsReceiver:"

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
FamixFusionnerJava >> visitFamixTLocalVariable: aFamixTLocalVariable [

	self visitFamixTStructuralEntity: aFamixTLocalVariable.
	"self acceptMeIfNotNil: aFamixTLocalVariable parentBehaviouralEntity."

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
FamixFusionnerJava >> visitFamixTPackage: aFamixTPackage [

	self visitFamixTCanBeStub: aFamixTPackage.
	self visitFamixTNamedEntity: aFamixTPackage.
	self visitTEntityMetaLevelDependency: aFamixTPackage.
	"self visitList: aFamixTPackage childEntities."

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTPackageable: aFamixTPackageable [

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTParameter: aFamixTParameter [

	self visitFamixTStructuralEntity: aFamixTParameter.
	"self acceptMeIfNotNil: aFamixTParameter parentBehaviouralEntity."

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTReference: aFamixTReference [

	self visitFamixTAssociation: aFamixTReference.
	"self acceptMeIfNotNil: aFamixTReference referencer.
	self acceptMeIfNotNil: aFamixTReference referredEntity."

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTThrowable: aFamixTThrowable [
	
	aFamixTThrowable catchingEntities do: [ :catchingEntity |
		catchingEntity isStub
			ifFalse: [
				catchingEntity caughtExceptions remove: aFamixTThrowable.
				catchingEntity addCaughtException: resourceEntity.
			]
	].

	aFamixTThrowable declaringEntities do: [ :declaringEntity |
		declaringEntity isStub
			ifFalse: [
				declaringEntity declaredExceptions remove: aFamixTThrowable.
				declaringEntity addDeclaredException: resourceEntity.
			]
	].

	aFamixTThrowable throwingEntities do: [ :throwingEntity |
		throwingEntity isStub
			ifFalse: [
				throwingEntity thrownExceptions remove: aFamixTThrowable.
				throwingEntity addThrownException: resourceEntity.
			]
	].

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTType: aFamixTType [

	self visitFamixTCanBeStub: aFamixTType.
	self visitFamixTNamedEntity: aFamixTType.
	self visitFamixTReferenceable: aFamixTType.
	self visitTEntityMetaLevelDependency: aFamixTType.
	"self acceptMeIfNotNil: aFamixTType typeContainer.
	self visitList: aFamixTType typedEntities."

	aFamixTType typedEntities do: [ :typedEntity |
		typedEntity declaredType: resourceEntity 
	]

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTWithAttributes: aFamixTWithAttributes [
	"don't visit parent/children relationships in fusionner (if parent or children are stub then entity is stub)"

	"self visitList: aFamixTWithAttributes attributes."

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTWithClasses: aFamixTWithClasses [
	"don't visit parent/children relationships in fusionner (if parent or children are stub then entity is stub)"

	"self visitFamixTWithTypes: aFamixTWithClasses."

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTWithComments: aFamixTWithComments [
	"don't visit parent/children relationships in fusionner (if parent or children are stub then entity is stub)"

	"self visitList: aFamixTWithComments comments."

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTWithEnumValues: aFamixTWithEnumValues [
	"don't visit parent/children relationships in fusionner (if parent or children are stub then entity is stub)"

	"self visitList: aFamixTWithEnumValues enumValues."

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTWithExceptions: aFamixTWithExceptions [
	"not doing anything to avoid infinite recursion
	 (visitFamixTWithExceptions -> visitFamixTThrowable -> visitFamixTWithExceptions...
	It seems less likely than a non-stub TThrowable be used by a stub TWithExceptions"


	"self visitList: aFamixTWithExceptions caughtExceptions.
	self visitList: aFamixTWithExceptions declaredExceptions.
	self visitList: aFamixTWithExceptions thrownExceptions."

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTWithFunctions: aFamixTWithFunctions [
	"don't visit parent/children relationships in fusionner (if parent or children are stub then entity is stub)"

	"self visitList: aFamixTWithFunctions functions."

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTWithGlobalVariables: aFamixTWithGlobalVariables [
	"don't visit parent/children relationships in fusionner (if parent or children are stub then entity is stub)"

	"self visitList: aFamixTWithGlobalVariables globalVariables."

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTWithImplicitVariables: aFamixTWithImplicitVariables [
	"don't visit parent/children relationships in fusionner (if parent or children are stub then entity is stub)"

	"self visitList: aFamixTWithImplicitVariables implicitVariables."

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTWithInheritances: aFamixTWithInheritances [
	"default implementation visits superInheritances, but we need subInheritances
	 (because it is more probable to have a stub super-class inherited by a non-stub class than the opposite)"

	aFamixTWithInheritances subInheritances do: [ :inheritance | self visitFamixTAssociation: inheritance ]

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTWithLambdas: aFamixTWithLambdas [
	"don't visit parent/children relationships in fusionner (if parent or children are stub then entity is stub)"

	"self visitList: aFamixTWithLambdas lambdas."

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTWithLocalVariables: aFamixTWithLocalVariables [
	"don't visit parent/children relationships in fusionner (if parent or children are stub then entity is stub)"

	"self visitList: aFamixTWithLocalVariables localVariables."

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTWithMethods: aFamixTWithMethods [
	"don't visit parent/children relationships in fusionner (if parent or children are stub then entity is stub)"

	"self visitList: aFamixTWithMethods methods."

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTWithParameters: aFamixTWithParameters [
	"don't visit parent/children relationships in fusionner (if parent or children are stub then entity is stub)"

	"self visitList: aFamixTWithParameters parameters."

]

{ #category : #'visiting - traits' }
FamixFusionnerJava >> visitFamixTWithTypes: aFamixTWithTypes [
	"don't visit parent/children relationships in fusionner (if parent or children are stub then entity is stub)"

	"self visitList: aFamixTWithTypes types."

]
