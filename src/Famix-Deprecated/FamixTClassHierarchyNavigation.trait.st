Trait {
	#name : #FamixTClassHierarchyNavigation,
	#category : #'Famix-Deprecated'
}

{ #category : #meta }
FamixTClassHierarchyNavigation classSide >> annotation [

	<FMClass: #TClassHierarchyNavigation super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #testing }
FamixTClassHierarchyNavigation classSide >> isDeprecated [
	"This class is now useless."
	^ true
]
