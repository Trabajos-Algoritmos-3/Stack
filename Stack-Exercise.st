!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'fj 6/6/2021 18:43:58'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ].
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'testStack collectionOfStackElements winterIsComing winningIsEverything winterSoldier theWindsOfWinter'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'setUp' stamp: 'fran 6/9/2021 22:35:14'!
setUp
	testStack := OOStack new.
	collectionOfStackElements := #('The winds of Winter' 'Winter Soldier' 'winning is everything' 'winter is coming').
	winterIsComing := 'winter is coming'.
	winningIsEverything := 'winning is everything'.
	winterSoldier := 'Winter Soldier'. 
	theWindsOfWinter := 'The winds of Winter'.
	testStack push: winterIsComing.
	testStack push: winningIsEverything.
	testStack push: winterSoldier.
	testStack push: theWindsOfWinter.! !


!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'fran 6/9/2021 22:28:28'!
test01UpperCasePrefixInStack
	|sentenceFinder prefix arrayOfSentences|
	prefix := 'Wint'. 
	sentenceFinder := SentenceFinderByPrefix with: testStack .
	arrayOfSentences := sentenceFinder find: prefix.
	self assert: arrayOfSentences size equals: 1.
	self assert: (arrayOfSentences includes: winterSoldier) equals: true.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'fran 6/9/2021 22:29:42'!
test02NoPrefixInStack
	|sentenceFinder prefix arrayOfSentences|
	prefix := 'uint'. 
	sentenceFinder := SentenceFinderByPrefix with: testStack.
	arrayOfSentences := sentenceFinder find: prefix.
	self assert: arrayOfSentences size equals: 0! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'fran 6/9/2021 22:30:18'!
test03StackDoesNotChangeSize
	|stackSize sentenceFinder prefix arrayOfSentences|
	prefix := 'Wint'.
	stackSize := testStack size.
	sentenceFinder := SentenceFinderByPrefix with: testStack .
	arrayOfSentences := sentenceFinder find: prefix.
	self assert: testStack size equals: stackSize.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'fran 6/9/2021 22:30:44'!
test04StackWithNoElementsReturnsEmptyArray
	|stack sentenceFinder prefix arrayOfSentences|
	stack := OOStack new.
	prefix := 'Wint'.
	sentenceFinder := SentenceFinderByPrefix with: stack.
	arrayOfSentences := sentenceFinder find: prefix.
	self assert: arrayOfSentences size equals: 0.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'fran 6/9/2021 22:31:17'!
test05LowerCasePrefixInStack
	|sentenceFinder prefix arrayOfSentences|
	prefix := 'wint'.
	sentenceFinder := SentenceFinderByPrefix with: testStack .
	arrayOfSentences := sentenceFinder find: prefix.
	self assert: arrayOfSentences size equals: 1.
	self assert: (arrayOfSentences includes: winterIsComing) equals: true.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'fran 6/9/2021 22:31:39'!
test06EmptyPrefixMustFail
	|sentenceFinder prefix |
	prefix := ''. 
	sentenceFinder := SentenceFinderByPrefix with: testStack.
	self
		should: [ sentenceFinder find: prefix. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix emptyPrefixIsNotValid ].
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'fran 6/9/2021 22:31:58'!
test07BlanckSpaceInPrefixMustFail
	|sentenceFinder prefix |
	prefix := 'Wint '.
	sentenceFinder := SentenceFinderByPrefix with: testStack.
	self
		should: [ sentenceFinder find: prefix. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixWithBlanckSpaceIsNotValid ].! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'fran 6/9/2021 22:35:28'!
test08StackDoesNotChangeOrder
	|sentenceFinder prefix arrayOfSentences elementValue|
	prefix := 'Wint'. 
	sentenceFinder := SentenceFinderByPrefix with: testStack.
	arrayOfSentences := sentenceFinder find: prefix.
	1 to: testStack size do: [:x | 
		elementValue := testStack pop.
		self assert: elementValue equals: (collectionOfStackElements at: x).
		].! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'fran 6/9/2021 21:42:15'!
test09SentenceMustBeInitializedWithStack
	|arrayOfElements |
	arrayOfElements := Array new.
	self
		should: [ SentenceFinderByPrefix with: arrayOfElements ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix sentenceFinderByPrefixMustBeInitializedWithAStack ].! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'fran 6/9/2021 22:19:57'!
test10PrefixCanBeANumber
	|stack sentenceFinder prefix arrayOfSentences|
	stack := OOStack new.
	prefix := '1'. 
	stack push: '1 first'.
	stack push: '2 second'.
	stack push: '3 third'.
	stack push: '4 fourth'.
	sentenceFinder := SentenceFinderByPrefix with: stack.
	arrayOfSentences := sentenceFinder find: prefix.
	self assert: arrayOfSentences size equals: 1.
	self assert: (arrayOfSentences includes: '1 first') equals: true.! !


!classDefinition: #NullStackElement category: 'Stack-Exercise'!
Object subclass: #NullStackElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NullStackElement methodsFor: 'as yet unclassified' stamp: 'fran 6/7/2021 19:50:49'!
value
	^self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elementOnTop size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'stack management' stamp: 'fran 6/7/2021 19:51:51'!
pop
	| topElementValue nextTopElement |
	topElementValue := elementOnTop value.
	nextTopElement := elementOnTop next.
	elementOnTop := nextTopElement.
	self reduceSize .
	^topElementValue .! !

!OOStack methodsFor: 'stack management' stamp: 'fj 6/6/2021 18:49:41'!
push: anElement
	|newTopElement|
	newTopElement := StackElement with: anElement followedBy: elementOnTop.
	elementOnTop := newTopElement .
	self increaseSize .
	! !


!OOStack methodsFor: 'accessing' stamp: 'fran 6/7/2021 19:46:39'!
isEmpty
	^size = 0.! !

!OOStack methodsFor: 'accessing' stamp: 'fj 6/6/2021 18:42:00'!
size
	^size.! !

!OOStack methodsFor: 'accessing' stamp: 'fran 6/7/2021 19:51:20'!
top
	^elementOnTop value.! !


!OOStack methodsFor: 'initialization' stamp: 'fj 6/6/2021 18:40:57'!
initialize
	elementOnTop := NullStackElement new.
	size := 0.! !


!OOStack methodsFor: 'private' stamp: 'fj 6/6/2021 18:49:08'!
increaseSize.
	size := size +1.
	! !

!OOStack methodsFor: 'private' stamp: 'fj 6/6/2021 18:49:23'!
reduceSize
	size := size -1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'error management' stamp: 'fran 6/9/2021 21:47:09'!
checkPrefixNotValid: prefix
	(prefix = '') ifTrue: [^self error: SentenceFinderByPrefix emptyPrefixIsNotValid].
	(prefix includesSubString: ' ') ifTrue: [^self error: SentenceFinderByPrefix prefixWithBlanckSpaceIsNotValid].! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'fran 6/9/2021 22:06:53'!
moveElementsFrom: aStack to: otherStack
	| elementsOfTheStack elementValue |
	elementsOfTheStack := OrderedCollection new.
	1 to: aStack size do: [:x | 
		elementValue := aStack pop.
		elementsOfTheStack add: elementValue. 
		otherStack push: elementValue.
		].
	^elementsOfTheStack.! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'fran 6/8/2021 21:45:49'!
InitializeWith: aStack
	stack := aStack.! !


!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'fran 6/9/2021 22:06:53'!
find: prefix
	|auxiliarStack collectionOfSentences collectionOfElements|
	self checkPrefixNotValid: prefix.
	auxiliarStack := OOStack new.
	collectionOfSentences := OrderedCollection new.
	collectionOfElements := self moveElementsFrom: stack to: auxiliarStack.
	collectionOfSentences := collectionOfElements select: [:each | each is: prefix substringAt: 1].
	self moveElementsFrom: auxiliarStack to: stack.
	^collectionOfSentences.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'fran 6/8/2021 22:59:14'!
emptyPrefixIsNotValid
	^'The prefix can not be empty'.! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'fran 6/8/2021 23:08:20'!
prefixWithBlanckSpaceIsNotValid
	^'The prefix can not contain blanck spaces'.! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'fran 6/9/2021 21:38:20'!
sentenceFinderByPrefixMustBeInitializedWithAStack
	^'The SentenceFinderByPrefix must be initialized with a stack'.! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'fran 6/9/2021 21:40:57'!
with: aStack
	(aStack isKindOf: OOStack) ifFalse: [^self error: SentenceFinderByPrefix sentenceFinderByPrefixMustBeInitializedWithAStack].
	^self new InitializeWith: aStack.
	! !


!classDefinition: #StackElement category: 'Stack-Exercise'!
Object subclass: #StackElement
	instanceVariableNames: 'value nextStackElement'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackElement methodsFor: 'as yet unclassified' stamp: 'fj 6/6/2021 18:40:02'!
initializeWith: anElement followedBy: elementOnTop
	value := anElement.
	nextStackElement := elementOnTop.! !

!StackElement methodsFor: 'as yet unclassified' stamp: 'fj 6/6/2021 18:40:35'!
next
	^nextStackElement .! !

!StackElement methodsFor: 'as yet unclassified' stamp: 'fran 6/7/2021 19:49:07'!
value
	^value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackElement class' category: 'Stack-Exercise'!
StackElement class
	instanceVariableNames: ''!

!StackElement class methodsFor: 'as yet unclassified' stamp: 'fj 6/6/2021 18:38:58'!
with: anElement followedBy: elementOnTop.
	^self new initializeWith: anElement followedBy: elementOnTop .! !
