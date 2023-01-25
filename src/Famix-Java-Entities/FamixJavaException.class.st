Class {
	#name : #FamixJavaException,
	#superclass : #FamixJavaEntity,
	#traits : 'FamixTCanImplement + FamixTException + FamixTHasVisibility + FamixTWithAnnotationInstances + FamixTWithTypes',
	#classTraits : 'FamixTCanImplement classTrait + FamixTException classTrait + FamixTHasVisibility classTrait + FamixTWithAnnotationInstances classTrait + FamixTWithTypes classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaException class >> annotation [

	<FMClass: #Exception super: #FamixJavaEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]
