Trait {
	#name : #FmxMBTestOnlyTraits1GeneratorTA,
	#instVars : [
		'#bs => FMMany type: #FmxMBTestOnlyTraits1GeneratorTB opposite: #as'
	],
	#category : #'Famix-MetamodelBuilder-TestOnlyTraits'
}

{ #category : #meta }
FmxMBTestOnlyTraits1GeneratorTA classSide >> annotation [

	<FMClass: #TA super: #Object>
	<package: #'Famix-MetamodelBuilder-TestOnlyTraits'>
	<generated>
	^self
]

{ #category : #adding }
FmxMBTestOnlyTraits1GeneratorTA >> addB: anObject [
	<generated>
	^ self bs add: anObject
]

{ #category : #accessing }
FmxMBTestOnlyTraits1GeneratorTA >> bs [
	"Relation named: #bs type: #FmxMBTestOnlyTraits1GeneratorTB opposite: #as"

	<generated>
	<derived>
	^ bs
]

{ #category : #accessing }
FmxMBTestOnlyTraits1GeneratorTA >> bs: anObject [

	<generated>
	bs value: anObject
]
