Class {
	#name : #FamixBasicInfrastructureGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'#entity => FamixDeprecatedSlot message: \'This variable should not be used anymore. XXXEntity is now the default root and you don\'\'t need to declare you inherit from it. If you wish to add property to it, get the class with `self ensureClassNamed: #Entity`.\'',
		'#sourceAnchor',
		'#sourceLanguage',
		'#sourcedEntity',
		'#comment',
		'#namedEntity',
		'#sourceTextAnchor'
	],
	#category : #'Famix-BasicInfrastructure'
}

{ #category : #testing }
FamixBasicInfrastructureGenerator class >> isAbstract [
	^ self = FamixBasicInfrastructureGenerator
]

{ #category : #accessing }
FamixBasicInfrastructureGenerator class >> submetamodels [
	^ {FamixGenerator}
]

{ #category : #definition }
FamixBasicInfrastructureGenerator >> defineClasses [
	super defineClasses.

	sourceAnchor := builder newAbstractClassNamed: #SourceAnchor.
	sourceLanguage := builder newClassNamed: #SourceLanguage.
	sourcedEntity := builder newAbstractClassNamed: #SourcedEntity.
	comment := builder newClassNamed: #Comment.
	namedEntity := builder newAbstractClassNamed: #NamedEntity.
	sourceTextAnchor := builder newClassNamed: #SourceTextAnchor
]

{ #category : #definition }
FamixBasicInfrastructureGenerator >> defineHierarchy [

	sourceAnchor --|> #TSourceAnchor.

	sourceLanguage --|> #TSourceLanguage.

	sourcedEntity --|> #TSourceEntity.
	"sourcedEntity --|> #TWithComments."

	comment --|> sourcedEntity.
	comment --|> #TComment.

	namedEntity --|> #TNamedEntity.

	sourceTextAnchor --|> sourceAnchor.
	sourceTextAnchor --|> #THasImmediateSource
]
