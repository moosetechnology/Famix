Extension { #name : #MooseModel }

{ #category : #'*Famix-Compatibility-Entities' }
MooseModel >> isSmalltalk [
	^ self sourceLanguage isNotNil and: [ self sourceLanguage isSmalltalk ]
]
