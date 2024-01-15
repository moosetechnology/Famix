"
## Relations
======================

### Other
- Relation: #parameterizedTypes Type: #FamixTParameterizedType Opposite: #parameterizableClass


"
Class {
	#name : #FamixJavaParameterizableInterface,
	#superclass : #FamixJavaInterface,
	#traits : 'FamixTWithParameterizedTypes',
	#classTraits : 'FamixTWithParameterizedTypes classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaParameterizableInterface class >> annotation [

	<FMClass: #ParameterizableInterface super: #FamixJavaInterface>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]
