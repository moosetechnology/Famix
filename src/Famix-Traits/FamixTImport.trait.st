Trait {
	#name : #FamixTImport,
	#instVars : [
		'#importingEntity => FMOne type: #FamixTWithImports opposite: #outgoingImports',
		'#importedEntity => FMOne type: #FamixTImportable opposite: #incomingImports'
	],
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTImport classSide >> annotation [

	<FMClass: #TImport super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTImport >> importedEntity [
	"Relation named: #importedEntity type: #FamixTImportable opposite: #incomingImports"

	<generated>
	<FMComment: 'Imported entity'>
	<source>
	^ importedEntity
]

{ #category : #accessing }
FamixTImport >> importedEntity: anObject [

	<generated>
	importedEntity := anObject
]

{ #category : #accessing }
FamixTImport >> importingEntity [
	"Relation named: #importingEntity type: #FamixTWithImports opposite: #outgoingImports"

	<generated>
	<FMComment: 'Importing entity'>
	<target>
	^ importingEntity
]

{ #category : #accessing }
FamixTImport >> importingEntity: anObject [

	<generated>
	importingEntity := anObject
]
