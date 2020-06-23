"
This trait provides a common, paradigm agnostic vocabulary to query dependencies of association entities at meta level.

For more informations: https://moosequery.ferlicot.fr/
"
Trait {
	#name : #TAssociationMetaLevelDependency,
	#category : #'Moose-Query-Traits'
}

{ #category : #meta }
TAssociationMetaLevelDependency classSide >> annotation [

	<FMClass: #TAssociationMetaLevelDependency super: #Object>
	<package: #'Moose-Query'>
	<generated>
	^self
]

{ #category : #private }
TAssociationMetaLevelDependency classSide >> privateSourceTypesIn: aMetamodel [
	"I return the classes that could be my source"

	^ (self allDeclaredPropertiesIn: aMetamodel)
		select: #isSource
		thenCollect: #implementingType
]

{ #category : #private }
TAssociationMetaLevelDependency classSide >> privateTargetTypesIn: aMetamodel [
	"I return the classes that could be my target"

	^ (self allDeclaredPropertiesIn: aMetamodel)
		select: #isTarget
		thenCollect: #implementingType
]

{ #category : #accessing }
TAssociationMetaLevelDependency classSide >> sourceTypesIn: aMetamodel [

	^ aMetamodel additionalProperty: #sourceTypes for: self ifAbsentPut: [ self privateSourceTypesIn: aMetamodel ]

]

{ #category : #accessing }
TAssociationMetaLevelDependency classSide >> targetTypesIn: aMetamodel [

	^ aMetamodel additionalProperty: #targetTypes for: self ifAbsentPut: [ self privateTargetTypesIn: aMetamodel ]

]

{ #category : #accessing }
TAssociationMetaLevelDependency >> sourceTypes [
	^ self class sourceTypesIn: self metamodel
]

{ #category : #accessing }
TAssociationMetaLevelDependency >> targetTypes [
	^ self class targetTypesIn: self metamodel
]
