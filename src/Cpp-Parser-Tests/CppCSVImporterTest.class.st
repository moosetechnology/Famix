Class {
	#name : #CppCSVImporterTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Cpp-Parser-Tests'
}

{ #category : #helpers }
CppCSVImporterTest >> missingDeclarationFile [
	^ '#Files
fileId,path
#Namespaces
id,name,parentId,file,line,column
#Types
id,name
#Classes
id,name,typeId,parentId,file,line,column,abstract,trivial,kind
#Funcs
id,name,typeId,parentId,file,line,column,lineE,vindex
#Vars
id,name,typeId,parentId,file,line,column
#Edges
sourceId,targetId,file,line,column,edgeType' 
]

{ #category : #helpers }
CppCSVImporterTest >> onlyDeclarationFile [
	^ '#Files
fileId,path
#Namespaces
id,name,parentId,file,line,column
#Packages
id,name,parentId
#Types
id,name
#Classes
id,name,typeId,parentId,file,line,column,abstract,trivial,kind,packageId
#Enums
id,name,typeId,parentId,file,line,column,packageId
#Funcs
id,name,typeId,parentId,file,line,column,lineE,vindex
#Vars
id,name,typeId,parentId,file,line,column
#Edges
sourceId,targetId,file,line,column,edgeType' 
]

{ #category : #running }
CppCSVImporterTest >> setUp [
	super setUp.
	model := CppModel new
]

{ #category : #tests }
CppCSVImporterTest >> testMissingDeclarationFile [
	self should: [ CppCSVImporter runOn: nil withRefFile: self missingDeclarationFile withModel: model ] raise: Error
]

{ #category : #tests }
CppCSVImporterTest >> testOnlyDeclarations [
	[CppCSVImporter
		runOn: nil
		withRefFile: self onlyDeclarationFile
		withModel: model.
		1/0
	] onErrorDo: [ :ex | ex traceCr. ].
]
