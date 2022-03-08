Extension { #name : #Object }

{ #category : #'*Cpp-Entities' }
Object >> isCPPSBlock [
	^ false

]

{ #category : #'*Cpp-Entities' }
Object >> isExistingMetricFor: anEntity [
	^ self ~= anEntity notExistentMetricValue
]
