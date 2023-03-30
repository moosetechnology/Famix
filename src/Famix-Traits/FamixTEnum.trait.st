"
This models an enum.

For example, the following Java code defines an Enum with seven EnumValues.

public enum Day {
    SUNDAY, MONDAY, TUESDAY, WEDNESDAY, 
    THURSDAY, FRIDAY, SATURDAY 
}

Instance Variables:
	values	<(MultivalueLink of: FamixTEnumValue)>
"
Trait {
	#name : #FamixTEnum,
	#traits : 'FamixTType + FamixTWithEnumValues',
	#classTraits : 'FamixTType classTrait + FamixTWithEnumValues classTrait',
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTEnum classSide >> annotation [

	<FMClass: #TEnum super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^ self
]
