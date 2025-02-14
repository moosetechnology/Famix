Trait {
	#name : #FamixFusionnerJava,
	#instVars : [
		'resourceModel',
		'consumerModel'
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

{ #category : #accessing }
FamixFusionnerJava >> resourceModel [

	^ resourceModel
]

{ #category : #accessing }
FamixFusionnerJava >> resourceModel: anObject [

	resourceModel := anObject
]
