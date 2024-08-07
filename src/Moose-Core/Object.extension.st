Extension { #name : #Object }

{ #category : #'*Moose-Core' }
Object >> allComplexPropertiesIn: aMetamodel [
	"All complex properties described in the metamodel.
	A complex property is a property whose type is not a primitive."

	aMetamodel ifNil: [ ^ OrderedCollection new ].
	^ aMetamodel descriptionOf: self class instanceSide ifPresent: #allComplexProperties ifAbsent: [ OrderedCollection new ]
]

{ #category : #'*Moose-Core' }
Object >> allDeclaredPropertiesIn: aMetamodel [
	"All properties described in the metamodel"

	aMetamodel ifNil: [ ^ OrderedCollection new ].
	^ aMetamodel descriptionOf: self class instanceSide ifPresent: #allProperties ifAbsent: [ OrderedCollection new ]
]

{ #category : #'*moose-core' }
Object >> asMooseGroup [ 
	^ MooseGroup with: self
]

{ #category : #'*moose-core' }
Object >> asMooseSpecializedGroup [

	^ MooseSpecializedGroup with: self
]

{ #category : #'*moose-core' }
Object >> hasUniqueMooseNameInModel [
	^false
]

{ #category : #'*Moose-Core' }
Object >> isMooseEntity [
	^ false 
]

{ #category : #'*Moose-Core' }
Object >> isMooseObject [
	^ false
]

{ #category : #'*Moose-Core' }
Object class >> isOfType: aClassFAMIX [
	^ false
]

{ #category : #'*moose-core' }
Object >> mooseDescription [

	^ self class asMooseDescription 
]

{ #category : #'*moose-core' }
Object >> mooseDisplayString [
	^ self
		deprecated: 'Please use #gtDisplayString instead'
		transformWith: '`@receiver mooseDisplayString' -> '`@receiver gtDisplayString'.
]

{ #category : #'*moose-core' }
Object >> mooseDisplayStringOn: aStream [
	self
		deprecated: 'Please use gtDisplayOn: instead'
		transformWith: '`@receiver mooseDisplayStringOn: `@statements' -> '`@receiver gtDisplayOn: `@statements'.
	^ self printOn: aStream
]

{ #category : #'*moose-core' }
Object >> mooseMenu [
	| menu pragmas submenus |
	menu := MenuMorph new.
	submenus := SmallDictionary new.
	pragmas := SmallDictionary new.

	"if multiple pragmas are declared for the same selector at different level of the hierarchy, 
	we only pick the bottom one (as picked by the dynamic lookup)"
	self class withAllSuperclasses
		do: [ :eachClass | 
			(Pragma allNamed: #menuItem:category: in: eachClass)
				do: [ :eachPragma | 
					pragmas at: eachPragma methodSelector ifAbsentPut: [ eachPragma ].
					submenus
						at: (eachPragma argumentAt: 2)
						ifAbsentPut: [ MenuMorph new ] ].
			(Pragma allNamed: #menuItem: in: eachClass)
				do:
					[ :eachPragma | pragmas at: eachPragma selector ifAbsentPut: [ eachPragma ] ] ].
	submenus
		keysAndValuesDo: [ :cat :smenu | menu add: cat asString subMenu: smenu ].
	(pragmas values
		asSortedCollection: [ :a :b | a methodSelector < b methodSelector ])
		do: [ :eachPragma | 
			eachPragma arguments size = 2
				ifTrue: [ "Submenu item"
					(submenus at: (eachPragma argumentAt: 2))
						add: (eachPragma argumentAt: 1)
						target: [ self perform: eachPragma methodSelector ]
						selector: #value ]
				ifFalse: [ "Top level item"
					menu
						add: (eachPragma argumentAt: 1)
						target: [ self perform: eachPragma selector ]
						selector: #value ] ].
	^ menu
]

{ #category : #'*Moose-Core' }
Object >> mooseMenuMorph [
	| menu pragmas submenus |
	menu := MenuMorph new.
	submenus := SmallDictionary new.
	pragmas := SmallDictionary new.

	"if multiple pragmas are declared for the same selector at different level of the hierarchy, 
	we only pick the bottom one (as picked by the dynamic lookup)"	
	self class withAllSuperclasses do: [ :eachClass | 
		(Pragma 
			allNamed: #menuItem:category:
			in: eachClass) do: [ :eachPragma | 
				pragmas at: eachPragma selector ifAbsentPut: [ eachPragma ].
				submenus at: (eachPragma argumentAt: 2) ifAbsentPut: [ MenuMorph new ]].
		(Pragma 
			allNamed: #menuItem:
			in: eachClass) do: [ :eachPragma | 
				pragmas at: eachPragma selector ifAbsentPut: [ eachPragma ]]
	].

	submenus keysAndValuesDo:  [:cat :smenu |
		menu add: cat asString subMenu: smenu ].
	(pragmas values asSortedCollection: [:a :b| a selector < b selector]) do: [ :eachPragma |
		(eachPragma arguments size = 2 )
			ifTrue: [ "Submenu item"
				(submenus at: (eachPragma argumentAt: 2))
					add: (eachPragma argumentAt: 1)
					target: [ self perform: eachPragma selector ]
					selector: #value
				]
			ifFalse: [ "Top level item"
				menu 
					add: (eachPragma argumentAt: 1)
					target: [ self perform: eachPragma selector ]
					selector: #value ]].
	^ menu
]

{ #category : #'*Moose-Core' }
Object >> mooseModel [
	^ nil
]

{ #category : #'*moose-core' }
Object >> mooseName [
	^ self printString asSymbol
]

{ #category : #'*Moose-Core' }
Object >> usesFamixTrait: aTrait [

	^ self class usesFamixTrait: aTrait
]
