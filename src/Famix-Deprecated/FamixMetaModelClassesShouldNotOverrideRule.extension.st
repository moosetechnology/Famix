Extension { #name : #FamixMetaModelClassesShouldNotOverrideRule }

{ #category : #'*Famix-Deprecated' }
FamixMetaModelClassesShouldNotOverrideRule >> group [
	"This metadata on the instance side is important for P12 but should be removed to have only the class side one in P13."

	^ self class group
]

{ #category : #'*Famix-Deprecated' }
FamixMetaModelClassesShouldNotOverrideRule >> name [
	"This metadata on the instance side is important for P12 but should be removed to have only the class side one in P13."

	^ self class ruleName
]

{ #category : #'*Famix-Deprecated' }
FamixMetaModelClassesShouldNotOverrideRule >> rationale [
	"This metadata on the instance side is important for P12 but should be removed to have only the class side one in P13."

	^ self class rationale
]
