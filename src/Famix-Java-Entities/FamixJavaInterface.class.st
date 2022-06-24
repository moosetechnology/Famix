Class {
	#name : #FamixJavaInterface,
	#superclass : #FamixJavaType,
	#traits : 'FamixTCanBeClassSide + FamixTCanBeFinal + FamixTHasVisibility + FamixTInvocationsReceiver + FamixTPackageable + FamixTWithAttributes + FamixTWithComments + FamixTWithInheritances + FamixTWithMethods + TOODependencyQueries',
	#classTraits : 'FamixTCanBeClassSide classTrait + FamixTCanBeFinal classTrait + FamixTHasVisibility classTrait + FamixTInvocationsReceiver classTrait + FamixTPackageable classTrait + FamixTWithAttributes classTrait + FamixTWithComments classTrait + FamixTWithInheritances classTrait + FamixTWithMethods classTrait + TOODependencyQueries classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaInterface class >> annotation [

	<FMClass: #Interface super: #FamixJavaType>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]
