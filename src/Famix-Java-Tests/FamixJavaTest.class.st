Class {
	#name : #FamixJavaTest,
	#superclass : #TestCase,
	#category : #'Famix-Java-Tests'
}

{ #category : #tests }
FamixJavaTest >> testImportAnnotations [
	| model |
	model := FamixJavaModel new.
	model
		importFromMSEStream:
			'(
		(Famix-Java-Entities.Package (id: 100) (name ''aPackage''))				
		(Famix-Java-Entities.Class (id: 1) (name ''AClass''))
		(Famix-Java-Entities.Class (id: 10) (name ''AnotherClass''))
		(Famix-Java-Entities.Method (id: 2) (name ''aMethod'') (parentType (ref: 1)))
		(Famix-Java-Entities.Class (id: 3) (name ''AnAnnotationDefinitionClass''))
		(Famix-Java-Entities.AnnotationType (id: 4) (name ''AnAnnotation'') (typeContainer (ref: 100)))
		(Famix-Java-Entities.Class (id: 5) (name ''AnotherAnnotationDefinitionClass''))
		(Famix-Java-Entities.AnnotationType (id: 6) (name ''AnotherAnnotation'') (typeContainer (ref: 100)))
		(Famix-Java-Entities.AnnotationInstance (id: 7) (annotatedEntity (ref: 1)) (annotationType (ref: 4)))
		(Famix-Java-Entities.AnnotationInstance (id: 8) (annotatedEntity (ref: 10)) (annotationType (ref: 4)))
		(Famix-Java-Entities.AnnotationInstance (id: 9) (annotatedEntity (ref: 2)) (annotationType (ref: 6)))
	)' readStream.
	self assert: model entities size equals: 11.
	self assert: model allAnnotationTypes size equals: 2.
	self assert: model allAnnotationInstances size equals: 3.
	model allAnnotationInstances
		do: [ :i | 
			self assert: (i annotationType instances includes: i).
			self assert: (i annotatedEntity annotationInstances includes: i) ].
	self assert: (model allAnnotationTypes entityNamed: #'aPackage::AnAnnotation') instances size equals: 2.
	self assert: (model allAnnotationTypes entityNamed: #'aPackage::AnotherAnnotation') instances size equals: 1.
	model allAnnotationTypes
		do: [ :each | 
			self assert: (each typeContainer definedAnnotationTypes includes: each).
			self assert: each typeContainer identicalTo: each belongsTo ]
]

{ #category : #tests }
FamixJavaTest >> testImportExceptions [
	| model |
	model := FamixJavaModel new.
	model
		importFromMSEStream:
			'(
				(Famix-Java-Entities.Class (id: 1) (name ''AClass''))
				(Famix-Java-Entities.Class (id: 2) (name ''AnotherClass''))
				(Famix-Java-Entities.Method (id: 3) (name ''method1'') (parentType (ref: 1)))
				(Famix-Java-Entities.Method (id: 4) (name ''method2'') (parentType (ref: 1)))
				(Famix-Java-Entities.Method (id: 5) (name ''method3'') (parentType (ref: 1)))
				(Famix-Java-Entities.Method (id: 6) (name ''method4'') (parentType (ref: 1)))
				(Famix-Java-Entities.Class (id: 10) (name ''ExceptionA''))
				(Famix-Java-Entities.Class (id: 11) (name ''ExceptionB''))
				(Famix-Java-Entities.DeclaredException (definingEntity (ref: 3)) (exceptionClass (ref: 10)))
				(Famix-Java-Entities.DeclaredException (definingEntity (ref: 4)) (exceptionClass (ref: 10)))
				(Famix-Java-Entities.DeclaredException (definingEntity (ref: 4)) (exceptionClass (ref: 11)))
				(Famix-Java-Entities.ThrownException (definingEntity (ref: 3)) (exceptionClass (ref: 10)))
				(Famix-Java-Entities.ThrownException (definingEntity (ref: 4)) (exceptionClass (ref: 11)))
				(Famix-Java-Entities.CaughtException (definingEntity (ref: 5)) (exceptionClass (ref: 11)))
				(Famix-Java-Entities.CaughtException (definingEntity (ref: 6)) (exceptionClass (ref: 11)))
			)' readStream.
	self assert: model entities size equals: 15.
	self assert: model allDeclaredExceptions size equals: 3.
	self assert: model allThrownExceptions size equals: 2.
	self assert: model allCaughtExceptions size equals: 2.
	model allDeclaredExceptions do: [ :each | self assert: (each definingEntity declaredExceptions includes: each) ].
	model allThrownExceptions do: [ :each | self assert: (each definingEntity thrownExceptions includes: each) ].
	model allCaughtExceptions do: [ :each | self assert: (each definingEntity caughtExceptions includes: each) ]
]

{ #category : #tests }
FamixJavaTest >> testInferNamespaces [
	| model |
	model  := FamixJavaModel new.
	model add: (FamixJavaPackage new name: 'org.project.package1').
	model add: (FamixJavaPackage new name: 'org.project.package2').
	self assert: model allPackages size equals: 2.
	model inferPackageParentsBasedOnNames.
	self assert: model allPackages size equals: 4
]
