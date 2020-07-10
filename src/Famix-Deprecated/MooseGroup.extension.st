Extension { #name : #MooseGroup }

{ #category : #'*Famix-Deprecated' }
MooseGroup >> selectByExpression: anExpression [
	self deprecated: 'Use #select: instead' transformWith: '`@receiver selectByExpression: `@statements1' -> '`@receiver select: `@statements1'.
	^ self select: anExpression
]

{ #category : #'*Famix-Deprecated' }
MooseGroup >> selectTop: aFraction forMetric: aSymbolOrBlock [
	"select top xx entities with highest metric value in the group. Useful to easily check the 80/20 rule.
	For example:
		self selectTop: 0.20 forMetric: #numberOfLinesOfCode
	returns the top 20% entities in number of lines of code"

	| topsSize sorted tops cutValue i |
	self deprecated: 'This feature is barelly used and will be removed in a future version of Moose. If you use it, feel free to copy it yourself as an extension.'.
	self assert: (aFraction >= 0 and: [ aFraction <= 1 ]).
	topsSize := (self size * aFraction) ceiling.	"number of entities to select"
	topsSize isZero ifTrue: [ ^ MooseGroup new ].
	sorted := self asSortedCollection: [ :a :b | (aSymbolOrBlock value: a) > (aSymbolOrBlock value: b) ].
	tops := sorted copyFrom: 1 to: topsSize.

	"We check whether next elements should be retrieved, because their value matches the one of the last element which made the cut."
	cutValue := aSymbolOrBlock value: (sorted at: topsSize).
	i := topsSize + 1.
	[ i <= sorted size and: [ (aSymbolOrBlock value: (sorted at: i)) = cutValue ] ]
		whileTrue: [ tops add: (sorted at: i).
			i := i + 1 ].
	^ MoosePropertyGroup withAll: tops from: self using: aSymbolOrBlock
]

{ #category : #'*Famix-Deprecated' }
MooseGroup >> selectTopTwentyForMetric: aSymbolOrBlock [
	"Return the 20% top most methods for the metric aSymbolOrBlock"

	self deprecated: 'This feature is barelly used and will be removed in a future version of Moose. If you use it, feel free to copy it yourself as an extension.'.
	^ self selectTop: 0.20 forMetric: aSymbolOrBlock
]
