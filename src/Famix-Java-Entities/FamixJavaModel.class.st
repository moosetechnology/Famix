Class {
	#name : #FamixJavaModel,
	#superclass : #MooseModel,
	#traits : 'FamixJavaTEntityCreator',
	#classTraits : 'FamixJavaTEntityCreator classTrait',
	#category : #'Famix-Java-Entities-Model'
}

{ #category : #accessing }
FamixJavaModel class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits')
]

{ #category : #meta }
FamixJavaModel class >> annotation [
	<FMClass: #FamixJavaModel super: #MooseModel>
	<package: #'Famix-Java-Entities'>
	<generated>
]

{ #category : #testing }
FamixJavaModel class >> canBeImportedFromFile [
	<generated>
	^true
]

{ #category : #accessing }
FamixJavaModel class >> importingContextClass [

	<generated>
	^ FamixJavaImportingContext
]

{ #category : #'as yet unclassified' }
FamixJavaModel >> inferPackageParentsBasedOnNames [
	<menuItem: 'Infer Namespace Parents Based on Names' category: 'Utilities'>
	| parent parentNameSize currentPosition parentName package |
	package := self allPackages.
	MooseCustomTask new
		with: [ :task | 
			package
				do: [ :each | 
					currentPosition := 1.
					each name: (each name copyReplaceAll: '.' with: '::').
					[ currentPosition := each name indexOf: $: startingAt: currentPosition.
					currentPosition isZero ]
						whileFalse: [ parentName := (each name copyFrom: 1 to: currentPosition - 1) asSymbol.
							package
								detect: [ :x | parentName = x mooseName ]
								ifNone: [ | newPackage |
									newPackage := (self factory entityNamed: #Package ifAbsent: [ self error: 'MM should contain a concept of namespace to apply this algo' ]) new
										name: parentName.
									package add: newPackage.
									self add: newPackage ].
							currentPosition := currentPosition + 2 ].
					task increment ].
			package
				do: [ :each | 
					each belongsTo
						ifNil: [ parentNameSize := (each name lastIndexOf: $:) - 2.
							parentNameSize > 0
								ifTrue: [ parent := package
										detect: [ :x | (each name copyFrom: 1 to: parentNameSize) asSymbol = x mooseName ]
										ifNone: [ nil ].
									parent
										ifNotNil: [ each name: (each name copyFrom: parentNameSize + 3 to: each name size) asSymbol.
											each parentPackage: parent ] ] ].
					task increment ] ]
			description: 'Infer parentPackage parents based on names'
			length: package size * 2;
		runWithProgress.
	^ self allNamespaces
]
