Trait {
	#name : #FmxMBTestOnlyTraits1GeneratorTB,
	#instVars : [
		'#as => FMMany type: #FmxMBTestOnlyTraits1GeneratorTA opposite: #bs'
	],
	#traits : 'FmxMBTestOnlyTraits1GeneratorTA',
	#classTraits : 'FmxMBTestOnlyTraits1GeneratorTA classTrait',
	#category : #'Famix-MetamodelBuilder-TestOnlyTraits'
}

{ #category : #meta }
FmxMBTestOnlyTraits1GeneratorTB classSide >> annotation [

	<FMClass: #TB super: #Object>
	<package: #'Famix-MetamodelBuilder-TestOnlyTraits'>
	<generated>
	^self
]

{ #category : #adding }
FmxMBTestOnlyTraits1GeneratorTB >> addA: anObject [
	<generated>
	^ self as add: anObject
]

{ #category : #accessing }
FmxMBTestOnlyTraits1GeneratorTB >> as [
	"Relation named: #as type: #FmxMBTestOnlyTraits1GeneratorTA opposite: #bs"

	<generated>
	^ as
]

{ #category : #accessing }
FmxMBTestOnlyTraits1GeneratorTB >> as: anObject [

	<generated>
	as value: anObject
]
