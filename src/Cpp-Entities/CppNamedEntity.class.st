Class {
	#name : #CppNamedEntity,
	#superclass : #CppSourcedEntity,
	#traits : 'FamixTHasModifiers + FamixTNamedEntity + TEntityMetaLevelDependency',
	#classTraits : 'FamixTHasModifiers classTrait + FamixTNamedEntity classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Cpp-Entities-Entities'
}

{ #category : #meta }
CppNamedEntity class >> annotation [

	<FMClass: #NamedEntity super: #CppSourcedEntity>
	<package: #'Cpp-Entities'>
	<generated>
	^self
]
