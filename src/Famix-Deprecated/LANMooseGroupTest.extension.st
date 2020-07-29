Extension { #name : #LANMooseGroupTest }

{ #category : #'*Famix-Deprecated' }
LANMooseGroupTest >> testSelectEightyCoverForMetric [
	| top |
	top := self model allMethods selectEightyCoverForMetric: #numberOfLinesOfCode.
	self denyEmpty: top
]

{ #category : #'*Famix-Deprecated' }
LANMooseGroupTest >> testSelectTopTwentyForMetric [
	| top remaining |
	top := self model allMethods selectTopTwentyForMetric: #numberOfLinesOfCode.
	remaining := self model allMethods entities copyWithoutAll: top.
	self assert: (remaining allSatisfy: [ :m | top noneSatisfy: [ :m2 | m2 numberOfLinesOfCode <= m numberOfLinesOfCode ] ])
]
