Class {
	#name : 'FamixTest2GroupTest',
	#superclass : 'FamixTest2SimpleModelTest',
	#category : 'Famix-Test2-Tests',
	#package : 'Famix-Test2-Tests'
}

{ #category : 'tests' }
FamixTest2GroupTest >> testClassGroupSuperclassIsTypeGroup [
	self assert: self classGroup superclass equals: self typeGroup
]

{ #category : 'tests' }
FamixTest2GroupTest >> testGroupsAreGenerated [
	self assert: (self class environment includesKey: #FamixTest2TypeGroup).
	self assert: (self class environment includesKey: #FamixTest2ClassGroup)
]

{ #category : 'tests' }
FamixTest2GroupTest >> testMooseSpecializedGroupAllWith [
	self assert: (model allUsing: FamixTClass) specialize class equals: self classGroup
]
