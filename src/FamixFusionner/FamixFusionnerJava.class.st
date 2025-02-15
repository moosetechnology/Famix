Class {
	#name : #FamixFusionnerJava,
	#superclass : #Object,
	#traits : 'FamixTTraitVisitor + FamixJavaVisitor',
	#classTraits : 'FamixTTraitVisitor classTrait + FamixJavaVisitor classTrait',
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
	"using the double-dispatch mechanism to replace all references to stub by references to resource"

	resourceEntity := resource.
	stub accept: self
]

{ #category : #accessing }
FamixFusionnerJava >> resourceModel [

	^ resourceModel
]

{ #category : #accessing }
FamixFusionnerJava >> resourceModel: anObject [

	resourceModel := anObject
]
