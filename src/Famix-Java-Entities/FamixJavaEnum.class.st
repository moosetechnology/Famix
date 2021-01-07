Class {
	#name : #FamixJavaEnum,
	#superclass : #FamixJavaType,
	#traits : 'FamixTEnum + FamixTHasVisibility + FamixTWithAttributes + FamixTWithMethods + FamixTWithInheritances',
	#classTraits : 'FamixTEnum classTrait + FamixTHasVisibility classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaEnum class >> annotation [

	<FMClass: #Enum super: #FamixJavaType>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixJavaEnum >> values [
	^ self enumValues
]

{ #category : #accessing }
FamixJavaEnum >> values: anObject [
	self enumValues: anObject
]
