Trait {
	#name : #FamixTUnknownVariable,
	#traits : 'FamixTStructuralEntity',
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTUnknownVariable classSide >> annotation [

	<FMClass: #TUnknownVariable super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #'moose query' }
FamixTUnknownVariable >> outgoingTypeDeclarations [
	^ self declaredType ifNil: [ {} ] ifNotNil: [ :dt | {(MooseQueryDependencyAssociation newFrom: self to: dt)} ]
]
