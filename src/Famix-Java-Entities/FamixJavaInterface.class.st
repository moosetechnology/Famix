Class {
	#name : #FamixJavaInterface,
	#superclass : #FamixJavaType,
	#traits : 'FamixJavaTImplementable + FamixTCanBeClassSide + FamixTCanBeFinal + FamixTHasVisibility + FamixTInvocationsReceiver + FamixTPackageable + FamixTWithAttributes + FamixTWithComments + FamixTWithInheritances + FamixTWithMethods + TOODependencyQueries',
	#classTraits : 'FamixJavaTImplementable classTrait + FamixTCanBeClassSide classTrait + FamixTCanBeFinal classTrait + FamixTHasVisibility classTrait + FamixTInvocationsReceiver classTrait + FamixTPackageable classTrait + FamixTWithAttributes classTrait + FamixTWithComments classTrait + FamixTWithInheritances classTrait + FamixTWithMethods classTrait + TOODependencyQueries classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaInterface class >> annotation [

	<FMClass: #Interface super: #FamixJavaType>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #testing }
FamixJavaInterface >> isInterface [

	<generated>
	^ true
]
