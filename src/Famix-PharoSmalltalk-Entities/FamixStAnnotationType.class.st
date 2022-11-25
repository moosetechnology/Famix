Class {
	#name : #FamixStAnnotationType,
	#superclass : #FamixStNamedEntity,
	#traits : 'FamixTAnnotationType + FamixTPackageable + FamixTWithAttributes + TEntityMetaLevelDependency',
	#classTraits : 'FamixTAnnotationType classTrait + FamixTPackageable classTrait + FamixTWithAttributes classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStAnnotationType class >> annotation [

	<FMClass: #AnnotationType super: #FamixStNamedEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #compatibility }
FamixStAnnotationType >> directSubclasses [
	^ OrderedCollection new
]

{ #category : #compatibility }
FamixStAnnotationType >> hierarchyNestingLevel [ 

	^ 1
]
