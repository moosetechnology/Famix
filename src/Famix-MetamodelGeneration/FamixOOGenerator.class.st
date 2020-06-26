Class {
	#name : #FamixOOGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'tClass',
		'classGroup',
		'tWithMethods',
		'tWithInheritances',
		'tWithAttributes',
		'tType',
		'tPackageable',
		'tInvocationsReceiver',
		'tWithComments',
		'tMethod',
		'tInheritance',
		'tAssociation',
		'typeGroup'
	],
	#category : #'Famix-MetamodelGeneration'
}

{ #category : #accessing }
FamixOOGenerator class >> packageName [

		^ #'Famix-OO-Traits'
]

{ #category : #accessing }
FamixOOGenerator class >> prefix [

	^ #FamixOO
]

{ #category : #accessing }
FamixOOGenerator class >> submetamodels [
	^ {FamixGenerator}
]

{ #category : #comments }
FamixOOGenerator >> commentForTClass [

	^ 'FAMIXClass represents an entity which can build new instances. A FAMIXClass is a FAMIXType, therefore it is involved in super/sub types relationships (depending on the language) and it holds attributes, methods.

FAMIX does not model explicitly interfaces, but a FAMIXClass can represent a Java interface by setting the isInterface property.

A class is typically scoped in a namespace. To model nested or anonymous classes, extractors can set the container of classes to classes or methods, respectively.'
]

{ #category : #comments }
FamixOOGenerator >> commentForTInheritance [

	^ ''
]

{ #category : #comments }
FamixOOGenerator >> commentForTWithInheritances [

	^ ''
]

{ #category : #definition }
FamixOOGenerator >> defineHierarchy [
	super defineHierarchy.
	tClass --|> tWithMethods.
	tClass --|> tWithInheritances.
	tClass --|> tWithAttributes.
	tClass inheritsFromTrait: tType without: { #queryStaticIncomingAssociations. #queryStaticOutgoingAssociations }.
	tClass --|> tPackageable.
	tClass --|> tInvocationsReceiver.
	tClass --|> tWithComments.
	tClass --|> #TOODependencyQueries.
	
	tInheritance --|> tAssociation.


	typeGroup := self remoteEntity: #TypeGroup withPrefix: #Famix.

	classGroup --|> typeGroup.
]

{ #category : #definition }
FamixOOGenerator >> defineRelations [
	super defineRelations.

				
	((tInheritance property: #subclass)
			comment: 'Subclass linked to in this relationship. from-side of the association';
			source)
		*-
	((tWithInheritances property: #superInheritances)
			comment: 'Superinheritance relationships, i.e. known superclasses of this type.').

	((tInheritance property: #superclass)
			comment: 'Superclass linked to in this relationship. to-side of the association';
			target)
		*-
	((tWithInheritances property: #subInheritances)
			comment: 'Subinheritance relationships, i.e. known subclasses of this type.').
]

{ #category : #definition }
FamixOOGenerator >> defineTraits [
	super defineTraits.
	tClass := builder newTraitNamed: #TClass.
	tClass comment: self commentForTClass.
	tClass withTesting.
	classGroup := tClass withGroup.
	

	tInheritance := builder newTraitNamed: #TInheritance.
	tInheritance comment: self commentForTInheritance.
	tInheritance withTesting.
	

	tWithInheritances := builder newTraitNamed: #TWithInheritances.
	tWithInheritances comment: self commentForTWithInheritances.

	self useRemoteTraits.
]

{ #category : #definition }
FamixOOGenerator >> useRemoteTraits [
	tWithAttributes := self remoteTrait: #TWithAttributes withPrefix: #Famix.
	tType := self remoteTrait: #TType withPrefix: #Famix.
	tPackageable := self remoteTrait: #TPackageable withPrefix: #Famix.
	tInvocationsReceiver := self remoteTrait: #TInvocationsReceiver withPrefix: #Famix.
	tWithComments := self remoteTrait: #TWithComments  withPrefix: #Famix. 
	tAssociation := self remoteTrait: #TAssociation withPrefix: #Famix.
	tWithMethods := self remoteTrait: #TWithMethods withPrefix: #Famix.
	
	"temporary remote traits"
	tMethod := self remoteTrait: #TMethod  withPrefix: #Famix.
	 
]
