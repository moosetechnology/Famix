Trait {
	#name : #FamixJavaTClassMetrics,
	#category : #'Famix-Java-Entities-Traits'
}

{ #category : #meta }
FamixJavaTClassMetrics classSide >> annotation [

	<FMClass: #TClassMetrics super: #Object>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #metrics }
FamixJavaTClassMetrics >> numberOfAccessorMethods [
	<FMProperty: #numberOfAccessorMethods type: #Number>
	<derived>
	<FMComment: 'The number of accessor methods in a class'>
	^ self
		lookUpPropertyNamed: #numberOfAccessorMethods
		computedAs: [ | noa |
			noa := 0.
			self methods
				do:
					[ :method | method isPureAccessor ifNotNil: [ (method isPureAccessor or: [ (method propertyNamed: #AccessorMethod) isNotNil ]) ifTrue: [ noa := noa + 1 ] ] ].
			noa ]
]

{ #category : #metrics }
FamixJavaTClassMetrics >> numberOfAccessorMethods: aNumber [
	self cacheAt: #numberOfAccessorMethods put: aNumber
]
