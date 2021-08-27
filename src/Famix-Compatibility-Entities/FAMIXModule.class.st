Class {
	#name : #FAMIXModule,
	#superclass : #FAMIXScopingEntity,
	#traits : 'FamixTModule + FamixTWithCompilationUnits + FamixTWithHeaders',
	#classTraits : 'FamixTModule classTrait + FamixTWithCompilationUnits classTrait + FamixTWithHeaders classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXModule class >> annotation [

	<FMClass: #Module super: #FAMIXScopingEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #accessing }
FAMIXModule >> classes [ 
	^ #()
]
