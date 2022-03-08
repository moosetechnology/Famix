"
TODO
"
Class {
	#name : #CppCSVGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'namespaces',
		'types',
		'classes',
		'enums',
		'functions',
		'variables',
		'edges',
		'csvValue',
		'csvLine',
		'fileLocation',
		'namespace',
		'type',
		'classe',
		'enum',
		'function',
		'variable',
		'edge',
		'filesLocations',
		'edgeUnspecified',
		'edgeBaseClass',
		'edgeFriend',
		'edgeTemplate',
		'edgeTemplateParam',
		'edgeMemberObject',
		'edgeCall',
		'edgeVirtCall',
		'edgeVarRead',
		'edgeVarWrite',
		'edgeConst',
		'edgeFuncAddr',
		'edgeOverCall'
	],
	#category : #'Cpp-Parser'
}

{ #category : #accessing }
CppCSVGrammar >> classe [
	^ csvLine
]

{ #category : #accessing }
CppCSVGrammar >> classes [
	^ (self header: '#Classes' description: 'id,name,typeId,parentId,file,line,column,abstract,trivial,kind') , classe plus
]

{ #category : #util }
CppCSVGrammar >> csvLine [
	^ $# asPParser not, (csvValue separatedBy: $, asPParser) withoutSeparators ", #newline asPParser plus"
]

{ #category : #util }
CppCSVGrammar >> csvValue [
	^ (($" asPParser , $" asPParser negate star flatten, $" asPParser) ==> [ :p | p second ]) / ($, asPParser / #newline asPParser) negate star flatten
]

{ #category : #edges }
CppCSVGrammar >> edge [
	^ $# asPParser not , ((csvValue , $, asPParser) ==> [ :p | p first ] times: 5)
		,
			(edgeConst / edgeFuncAddr / edgeOverCall / edgeUnspecified / edgeBaseClass / edgeFriend / edgeTemplate / edgeTemplateParam / edgeMemberObject
				/ edgeCall / edgeVirtCall / edgeVarRead / edgeVarWrite)	", #newline asPParser plus"
]

{ #category : #edges }
CppCSVGrammar >> edgeBaseClass [
	^ self edgeWithKind: 1
]

{ #category : #edges }
CppCSVGrammar >> edgeCall [
	^ self edgeWithKind: 6
]

{ #category : #edges }
CppCSVGrammar >> edgeConst [
	^ self edgeWithKind: 10
]

{ #category : #edges }
CppCSVGrammar >> edgeFriend [
	^ self edgeWithKind: 2
]

{ #category : #edges }
CppCSVGrammar >> edgeFuncAddr [
	^ self edgeWithKind: 11
]

{ #category : #edges }
CppCSVGrammar >> edgeMemberObject [
	^ self edgeWithKind: 5
]

{ #category : #edges }
CppCSVGrammar >> edgeOverCall [
	^ self edgeWithKind: 12
]

{ #category : #edges }
CppCSVGrammar >> edgeTemplate [
	^ self edgeWithKind: 3
]

{ #category : #edges }
CppCSVGrammar >> edgeTemplateParam [
	^ self edgeWithKind: 4
]

{ #category : #edges }
CppCSVGrammar >> edgeUnspecified [
	^ self edgeWithKind: 0
]

{ #category : #edges }
CppCSVGrammar >> edgeVarRead [
	^ self edgeWithKind: 8
]

{ #category : #edges }
CppCSVGrammar >> edgeVarWrite [
	^ self edgeWithKind: 9
]

{ #category : #edges }
CppCSVGrammar >> edgeVirtCall [
	^ self edgeWithKind: 7
]

{ #category : #edges }
CppCSVGrammar >> edgeWithKind: aCodeNumber [
	^ aCodeNumber asString asPParser
]

{ #category : #edges }
CppCSVGrammar >> edges [
	^ (self header: '#Edges' description: 'sourceId,targetId,file,line,column,edgeType') , edge plus
]

{ #category : #accessing }
CppCSVGrammar >> enum [
	^ csvLine
]

{ #category : #accessing }
CppCSVGrammar >> enums [
	^ (self header: '#Enums' description: 'id,name,typeId,parentId,file,line,column') ,  enum plus
]

{ #category : #accessing }
CppCSVGrammar >> fileLocation [
	^ csvLine
]

{ #category : #accessing }
CppCSVGrammar >> filesLocations [
	^ (self header: '#Files' description: 'fileId,path'),  fileLocation plus
]

{ #category : #accessing }
CppCSVGrammar >> function [
	^ csvLine
]

{ #category : #accessing }
CppCSVGrammar >> functions [
	^ (self header: '#Funcs' description: 'id,name,typeId,parentId,file,line,column,lineE,vindex') , function plus
]

{ #category : #util }
CppCSVGrammar >> header: title description: description [
	^ title asPParser, #newline asPParser, description asPParser, #newline asPParser
]

{ #category : #accessing }
CppCSVGrammar >> namespace [
	^ csvLine
]

{ #category : #accessing }
CppCSVGrammar >> namespaces [
	^ (self header: '#Namespaces' description: 'id,name,parentId,file,line,column'), namespace plus
]

{ #category : #accessing }
CppCSVGrammar >> package [
	^ csvLine
]

{ #category : #accessing }
CppCSVGrammar >> start [
	"Answer the production to start this parser with."

	^ (filesLocations, namespaces, types, classes, enums, functions, variables, edges) end
]

{ #category : #accessing }
CppCSVGrammar >> type [
	^ csvLine
]

{ #category : #accessing }
CppCSVGrammar >> types [
	^ (self header: '#Types' description: 'id,name'), type plus
]

{ #category : #accessing }
CppCSVGrammar >> variable [
	^ csvLine
]

{ #category : #accessing }
CppCSVGrammar >> variables [
	^ (self header: '#Vars' description: 'id,name,typeId,parentId,file,line,column'), variable plus
]
