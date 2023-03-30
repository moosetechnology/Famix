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
	| model method1 method2 method3 exceptionA exceptionB |
	model := FamixJavaModel new.
	model
		importFromMSEStream:
			'(
	(Famix-Java-Entities.Class (id: 1) (name ''AClass''))
	(Famix-Java-Entities.Method (id: 2) (name ''method1'') (caughtExceptions (ref: 3)) (parentType (ref: 1)))
	(Famix-Java-Entities.Method (id: 5) (name ''method2'') (declaredExceptions (ref: 6)) (thrownExceptions (ref: 6)) (parentType (ref: 1)))
	(Famix-Java-Entities.Method (id: 7) (name ''method3'') (declaredExceptions (ref: 6) (ref: 3)) (thrownExceptions (ref: 3)) (caughtExceptions (ref: 3)) (parentType (ref: 1)))
	(Famix-Java-Entities.Exception (id: 3) (name ''ExceptionB''))
	(Famix-Java-Entities.Class (id: 4) (name ''AnotherClass''))
	(Famix-Java-Entities.Method (id: 8) (name ''method4'') (parentType (ref: 4)))
	(Famix-Java-Entities.Exception (id: 6) (name ''ExceptionA''))
		)' readStream.
		
	self assert: model entities size equals: 8.
	self assert: (model allModelClasses select: #isException) size equals: 2.
	
	method1 := model entities detect: [ :e | e name = 'method1' ].
	method2 := model entities detect: [ :e | e name = 'method2' ].
	method3 := model entities detect: [ :e | e name = 'method3' ].
	exceptionA := model entities detect: [ :e | e name = 'ExceptionA' ].
	exceptionB := model entities detect: [ :e | e name = 'ExceptionB' ].
	
	self assertCollection: method1 caughtExceptions hasSameElements: { exceptionB }.

	self assertCollection: method2 declaredExceptions hasSameElements: { exceptionA }.
	self assertCollection: method2 thrownExceptions hasSameElements: { exceptionA }.
	
	self assertCollection: method3 caughtExceptions hasSameElements: { exceptionB }.
	self assertCollection: method3 declaredExceptions hasSameElements: { exceptionB. exceptionA }.
	self assertCollection: method3 thrownExceptions hasSameElements: { exceptionB }.
	
	self assertCollection: exceptionB declaringEntities  hasSameElements: { method3 }.
	self assertCollection: exceptionB throwingEntities  hasSameElements: { method3 }.
	self assertCollection: exceptionB catchingEntities  hasSameElements: { method1 . method3 }.

	
	self assertCollection: exceptionA declaringEntities  hasSameElements: { method2. method3 }.
	self assertCollection: exceptionA throwingEntities  hasSameElements: { method2 }.
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

{ #category : #tests }
FamixJavaTest >> testModelImportableFromFile [
	self assert: FamixJavaModel canBeImportedFromFile
]
