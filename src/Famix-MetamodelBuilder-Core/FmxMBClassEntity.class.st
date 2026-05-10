Class {
	#name : 'FmxMBClassEntity',
	#superclass : 'FmxMBClass',
	#instVars : [
		'propertiesForEqualityCheck',
		'isAbstractClass'
	],
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

{ #category : 'visitor' }
FmxMBClassEntity >> acceptVisitor: aVisitor [

	<ignoreForCoverage>
	^ aVisitor visitClassEntity: self
]

{ #category : 'settings - default' }
FmxMBClassEntity >> defaultSuperclassName [
	"We have a special case with MooseObject that should inherit from Object."

	self isMooseObject ifTrue: [ ^ #Object ].

	^ super defaultSuperclassName
]

{ #category : 'testing' }
FmxMBClassEntity >> isAbstractClass [

	^ isAbstractClass ifNil: [ false ]
]

{ #category : 'accessing' }
FmxMBClassEntity >> isAbstractClass: aBoolean [

	isAbstractClass := aBoolean
]

{ #category : 'testing' }
FmxMBClassEntity >> isClassEntity [

	^ true
]

{ #category : 'testing' }
FmxMBClassEntity >> isConcreteClass [

	^ self isAbstractClass not
]

{ #category : 'testing' }
FmxMBClassEntity >> isMooseObject [

	^ self name = 'Object' and: [ self prefix = 'Moose' ]
]

{ #category : 'testing' }
FmxMBClassEntity >> isRoot [

	self superclass ifNotNil: [ ^ false ]. 
	
	"We have a special case with MooseObject because we do not want to consider it as a root but it inherits from Object."
	^ self isMooseObject not
]

{ #category : 'accessing' }
FmxMBClassEntity >> propertiesForEqualityCheck [

	^ propertiesForEqualityCheck
]

{ #category : 'generalization' }
FmxMBClassEntity >> withEqualityCheckOn: aCollectionOfPropertySymbol [

	propertiesForEqualityCheck := aCollectionOfPropertySymbol
]
