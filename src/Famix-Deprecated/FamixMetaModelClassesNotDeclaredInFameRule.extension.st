Extension { #name : #FamixMetaModelClassesNotDeclaredInFameRule }

{ #category : #'*Famix-Deprecated' }
FamixMetaModelClassesNotDeclaredInFameRule >> group [
	"This metadata on the instance side is important for P12 but should be removed to have only the class side one in P13."

	^ self class group
]

{ #category : #'*Famix-Deprecated' }
FamixMetaModelClassesNotDeclaredInFameRule >> name [
	"This metadata on the instance side is important for P12 but should be removed to have only the class side one in P13."

	^ self class ruleName
]
