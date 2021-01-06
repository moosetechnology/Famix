Trait {
	#name : #FamixTWithClasses,
	#traits : 'FamixTWithTypes',
	#category : #'Famix-Traits-Class'
}

{ #category : #meta }
FamixTWithClasses classSide >> annotation [

	<FMClass: #TWithClasses super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithClasses >> classes [
	"Classes are usually seen as types from the point of view of a Container. However, there may other types (e.g. aspects) which we dont want to see as classes and are rejected by this method."

	<navigation: 'Classes'>
	^ self cacheAt: #classes ifAbsentPut: [ self types select: #isClass ]
]

{ #category : #accessing }
FamixTWithClasses >> numberOfClasses [
	<FMProperty: #numberOfClasses type: #Number>
	<derived>
	<FMComment: 'The number of classes in a package'>
	^ self classes size
]
