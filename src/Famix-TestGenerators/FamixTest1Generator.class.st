"
""
FamixSandboxGenerator new generate.
""
| model c c2 m m2 sa1 | 

model := MooseModel new.
c := FamixSandClass named: 'Class1'.
c2 := FamixSandClass named: 'Class2'.
m := FamixSandMethod named: 'method1'.
m2 := FamixSandMethod named: 'method2'.
""sa1 := FamixSandSourceTextAnchor new source: 'method1 source' .""
sa1 := FamixSandIndexedFileAnchor new fileName: '/tmp/s/source.txt'.
sa1 startPos: 3.
sa1 endPos: 10.

model addAll: { c. c2. m. m2. sa1 }.

m parentType: c.
m2 parentType: c2.

m sourceAnchor: sa1.

model.
"
Class {
	#name : 'FamixTest1Generator',
	#superclass : 'FamixBasicInfrastructureGenerator',
	#instVars : [
		'method',
		'attribute',
		'association',
		'file',
		'fileAnchor',
		'folder',
		'indexedFileAnchor',
		'multipleFileAnchor',
		'class',
		'model',
		'tCanBeClassSide',
		'bytesFileAnchor',
		'inheritance',
		'annotationType1',
		'withAnnotationType1',
		'annotationType2',
		'withAnnotationType2',
		'tEntity'
	],
	#category : 'Famix-TestGenerators',
	#package : 'Famix-TestGenerators'
}

{ #category : 'accessing' }
FamixTest1Generator class >> packageName [

	^ #'Famix-Test1-Entities'
]

{ #category : 'accessing' }
FamixTest1Generator class >> prefix [

	^ #'FamixTest1'
]

{ #category : 'definition' }
FamixTest1Generator >> defineClasses [

	super defineClasses.

	model := builder model.
	model comment: 'This is a the comment of the model class'.

	class := builder newClassNamed: #Class.
	class comment: 'This a comment for the Class entity'.
	method := builder newClassNamed: #Method.
	attribute := builder newClassNamed: #Attribute.
	association := builder newClassNamed: #Association.
	inheritance := builder newClassNamed: #Inheritance.

	file := builder newClassNamed: #File.
	fileAnchor := builder newClassNamed: #FileAnchor.
	folder := builder newClassNamed: #Folder.
	indexedFileAnchor := builder newClassNamed: #IndexedFileAnchor.
	bytesFileAnchor := builder newClassNamed: #BytesFileAnchor.
	multipleFileAnchor := builder newClassNamed: #MultipleFileAnchor.

	annotationType1 := builder newClassNamed: #AnnotationType1.
	withAnnotationType1 := builder newClassNamed: #WithAnnotationType1.

	annotationType2 := builder newClassNamed: #AnnotationType2.
	withAnnotationType2 := builder newClassNamed: #WithAnnotationType2
]

{ #category : 'definition' }
FamixTest1Generator >> defineHierarchy [

	super defineHierarchy.

	(builder ensureClassNamed: #Entity) --|> tEntity.

	tEntity --|> #TEntityMetaLevelDependency.

	association --|> #TAssociation.

	attribute
		--|> namedEntity;
		--|> #TWithSourceLanguages;
		--|> #TAttribute;
		--|> #TSourceEntity;
		--|> tCanBeClassSide.

	bytesFileAnchor --|> sourceAnchor.
	bytesFileAnchor --|> #TBytesFileAnchor.

	class
		--|> namedEntity;
		--|> #TWithSourceLanguages;
		--|> #TClass;
		--|> #TSourceEntity;
		--|> #TPackageable;
		--|> #TWithComments.

	file --|> namedEntity.
	file --|> #TFile.

	fileAnchor --|> sourceAnchor.
	fileAnchor --|> #TFileNavigation.

	folder --|> namedEntity.
	folder --|> #TFolder.

	indexedFileAnchor --|> sourceAnchor.
	indexedFileAnchor --|> #TIndexedFileNavigation.

	inheritance --|> #TInheritance.

	method
		--|> namedEntity;
		--|> #TWithSourceLanguages;
		--|> #TMethod;
		--|> #THasKind;
		--|> tCanBeClassSide;
		--|> #TWithComments.

	multipleFileAnchor --|> sourceAnchor.
	multipleFileAnchor --|> #TMultipleFileAnchor.

	sourcedEntity
		--|> #TWithFiles;
		--|> #TWithSourceLanguages
]

{ #category : 'definition' }
FamixTest1Generator >> defineProperties [
	super defineProperties.
	model property: #modelHasProperties type: #Object.
	((tCanBeClassSide property: #isClassSide type: #Boolean) 
		comment: 'Entity can be declared class side i.e. static').	
]

{ #category : 'definition' }
FamixTest1Generator >> defineRelations [

	super defineRelations.

	self
		apply: #TAnnotationType
		on: annotationType1
		oppositeTrait: #TWithAnnotationTypes
		on: withAnnotationType1.

	self apply: #TWithAnnotationTypes on: withAnnotationType2 oppositeOn: annotationType2
]

{ #category : 'definition' }
FamixTest1Generator >> defineTraits [

	super defineTraits.

	tCanBeClassSide := builder newTraitNamed: #TCanBeClassSide.
	tEntity := builder newTraitNamed: #TEntity
]

{ #category : 'definition' }
FamixTest1Generator >> newBuilder [

	^ super newBuilder
		  withFileImport;
		  yourself
]
