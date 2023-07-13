"
This is the abstract representation of an Exception. It is specific to Java. It points to an exceptionClass. The class of a FamixTException is a normal FamixTClass.
"
Trait {
	#name : #FamixTException,
	#traits : 'FamixTClass + FamixTThrowable',
	#classTraits : 'FamixTClass classTrait + FamixTThrowable classTrait',
	#category : #'Famix-Traits-Exception'
}

{ #category : #meta }
FamixTException classSide >> annotation [

	<FMClass: #TException super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]

{ #category : #testing }
FamixTException >> isException [

	<generated>
	^ true
]
