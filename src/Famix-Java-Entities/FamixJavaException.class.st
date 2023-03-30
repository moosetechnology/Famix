Class {
	#name : #FamixJavaException,
	#superclass : #FamixJavaClass,
	#traits : 'FamixTCanImplement + FamixTException + FamixTHasVisibility + FamixTWithAnnotationInstances + FamixTWithTypes',
	#classTraits : 'FamixTCanImplement classTrait + FamixTException classTrait + FamixTHasVisibility classTrait + FamixTWithAnnotationInstances classTrait + FamixTWithTypes classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaException class >> annotation [

	<FMClass: #Exception super: #FamixJavaClass>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]
