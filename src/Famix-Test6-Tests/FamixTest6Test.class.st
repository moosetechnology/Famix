Class {
	#name : #FamixTest6Test,
	#superclass : #TestCase,
	#category : #'Famix-Test6-Tests'
}

{ #category : #running }
FamixTest6Test >> testDefaultValueEmptyString [

	| bacon brandProperty newBrand |
	bacon := FamixTest6Bacon new.
	brandProperty := bacon mooseDescription properties detect: [ :each |
		                 each name = #brand ].

	self assert: bacon brand equals: ''.
	self assert: brandProperty defaultValue equals: ''.

	newBrand := 'WonderfulBacon'.
	bacon brand: newBrand.
	self assert: bacon brand equals: newBrand.
	self assert: brandProperty defaultValue equals: ''
]

{ #category : #running }
FamixTest6Test >> testDefaultValueOnCreation [

	| bacon brandProperty |
	bacon := FamixTest6Bacon new.
	brandProperty := (bacon mooseDescription properties select: [ :each |
		                  each name = #isFood ]) at: 1.

	self assert: bacon isFood.
	self assert: brandProperty defaultValue.

	bacon isFood: false.
	self deny: bacon isFood.
	self assert: brandProperty defaultValue
]

{ #category : #running }
FamixTest6Test >> testDefaultValueOnCreation2 [

	| bacon eggProperty |
	bacon := FamixTest6Bacon new.
	eggProperty := (bacon mooseDescription properties select: [ :each | 
		                each name = #eggs ]) at: 1.

	self assert: bacon eggs equals: 12.
	self assert: eggProperty defaultValue equals: 12.

	bacon eggs: 0.
	self assert: bacon eggs equals: 0.
	self assert: eggProperty defaultValue equals: 12
]

{ #category : #running }
FamixTest6Test >> testDefaultValueOnCreationInheritance [

	| spam eggProperty bacon |
	spam := FamixTest6Spam new.

	self assert: spam isSomething equals: false.
	self assert: spam isFood equals: true.
	self assert: spam eggs equals: 12.

	spam isSomething: true.
	spam isFood: false.
	spam eggs: 1.

	self assert: spam isSomething equals: true.
	self assert: spam isFood equals: false.
	self assert: spam eggs equals: 1
]
