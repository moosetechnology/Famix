Extension { #name : #AbstractFamixNavigationTest }

{ #category : #'*Famix-Deprecated' }
AbstractFamixNavigationTest >> getMethod: methodNameString from: aFAMIXClass [
	self deprecated: 'Use #getMethod: instead.' transformWith: '`@receiver getMethod: `@statements1 from: `@statements2' -> '`@receiver getMethod: `@statements1'.
	^ self getMethod: methodNameString
]
