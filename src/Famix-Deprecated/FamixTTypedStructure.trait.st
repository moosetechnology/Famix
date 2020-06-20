Trait {
	#name : #FamixTTypedStructure,
	#traits : 'FamixTTypedEntity',
	#classTraits : 'FamixTTypedEntity classTrait',
	#category : #'Famix-Deprecated'
}

{ #category : #meta }
FamixTTypedStructure classSide >> annotation [
]

{ #category : #testing }
FamixTTypedStructure classSide >> isDeprecated [
	"TTypedStructure was renamed #TTypedEntity. You should update your generator."

	^ true
]

{ #category : #'moose query' }
FamixTTypedStructure >> outgoingTypeDeclarations [
	^ self declaredType ifNil: [ {} ] ifNotNil: [ :dt | {(MooseQueryDependencyAssociation newFrom: self to: dt)} ]
]
