Extension { #name : #FMMultivalueLink }

{ #category : #'*Moose-Query' }
FMMultivalueLink >> atScopeInContext: aContext [
	^ values atScopeInContext: aContext
]

{ #category : #'*Moose-Query' }
FMMultivalueLink >> toScopeInContext: aContext [
	^ values toScopeInContext: aContext
]

{ #category : #'*Moose-Query' }
FMMultivalueLink >> withScopeInContext: aContext [
	^ values withScopeInContext: aContext
]
