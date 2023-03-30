Class {
	#name : #FamixJavaAnnotationType,
	#superclass : #FamixJavaType,
	#traits : 'FamixTAnnotationType + FamixTHasVisibility + FamixTImplementable + FamixTPackageable + FamixTWithAttributes + FamixTWithComments + FamixTWithInheritances',
	#classTraits : 'FamixTAnnotationType classTrait + FamixTHasVisibility classTrait + FamixTImplementable classTrait + FamixTPackageable classTrait + FamixTWithAttributes classTrait + FamixTWithComments classTrait + FamixTWithInheritances classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaAnnotationType class >> annotation [

	<FMClass: #AnnotationType super: #FamixJavaType>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #'accessing-query' }
FamixJavaAnnotationType >> annotatedEntities [
	^ self instances collect: [:each | each annotatedEntity ]
]

{ #category : #'accessing-query' }
FamixJavaAnnotationType >> annotatedEntitiesGroup [
	<navigation: 'Annotated entities'>
	^ self annotatedEntities asMooseGroup
]

{ #category : #accessing }
FamixJavaAnnotationType >> typeContainer [

	^ self annotationTypesContainer
]

{ #category : #accessing }
FamixJavaAnnotationType >> typeContainer: anObject [

	^ self annotationTypesContainer: anObject
]
