Class {
	#name : 'FmxMBTrait',
	#superclass : 'FmxMBBehavior',
	#category : 'Famix-MetamodelBuilder-Core-Implementation',
	#package : 'Famix-MetamodelBuilder-Core',
	#tag : 'Implementation'
}

{ #category : 'testing' }
FmxMBTrait class >> isAbstract [

	^ self = FmxMBTrait
]

{ #category : 'visitor' }
FmxMBTrait >> acceptVisitor: aVisitor [

	<ignoreForCoverage>
	^ aVisitor visitTrait: self.
]

{ #category : 'accessing' }
FmxMBTrait >> allTraitGeneralizations [

	^ (self traitGeneralizations flatCollect: [ :each |
		   { each } , each allTraitGeneralizations ]) removeDuplicates
]

{ #category : 'settings-default' }
FmxMBTrait >> defaultTag [

	^ #Traits
]

{ #category : 'testing' }
FmxMBTrait >> isMetamodelTrait [

	^ true
]

{ #category : 'testing' }
FmxMBTrait >> isVisitorTrait [

	^ false
]

{ #category : 'name conversion' }
FmxMBTrait >> pluralPropertyName [
	^ self pluralOf: self propertyName
]

{ #category : 'name conversion' }
FmxMBTrait >> propertyName [
	^ (self name withoutPrefix: 'T') uncapitalized
]

{ #category : 'accessing' }
FmxMBTrait >> removeRelation: aRelation [

	propertiesAndRelations remove: aRelation ifAbsent: [ ].
]

{ #category : 'accessing' }
FmxMBTrait >> superclassName [
	"For trait we declare the Fame superclass as Object"

	^ 'Object'
]
