-- /= is in Haskell != operator
-- + expects its left and right side to be numbers
-- == works on any two things that can be compared but the catch is that they both have to be the same type
-- of thing
-- infix function arg1 name_of_the_function arg2


-- In Haskell functions are called by writing the function name, a space and then the parameters,
-- separated by commas

-- succ 8 -- will return 9 - a successor of the number


-- min 9 10 
-- > 9
-- max 3.4 3.2
-- > 3.4

-- function application (calling a function by putting a space after it and then typing out the parameters)
-- has the highest precedence of them all; 
-- what that means for us is that these two statements are equivalent
-- succ 9 + max 5 4 + 1 
-- (succ 9) + (max 5 4 ) + 1


-- if a function takes two parameters we can also call it as an infix function 
-- by surrounding it with backticks
-- div 92 10 is the same as 92 `div` 10


-- my first function 
doubleMe x = x + x 

-- + works on integers as well as on floating-point numbers (anything that can be considered a number, really)

-- doubleUs x y = x * 2 + y * 2

-- we can redifine doubleUs as follows 
doubleUs x y = doubleMe x + doubleMe y


-- functions in Haskell don't have to be in any particular order, so 
-- it does not matter if you define doubleMe first and the doubleUs or if you do it the other way around

doubleSmallNumber x = if x > 100 
                      then x 
                      else x * 2
-- the difference between Haskell's if statement and if statements in imperative 
-- languages is that the else part is mandatory in Haskell

-- if statment in Haskell is an expression -> it returns the value!
-- because else statement is mandatory and if-else statment will always return the value!

-- if we waanted to add one to every number that's produce in our previous function 
-- we could have written its body like this 
doubleSmallNumber' x = (if x > 100 then x else x * 2) + 1

-- we usualyy use ' to either denote a strict version of a function (one that isn't lazy) or 
-- a slightly modified version of a function or a variable 

-- function names cannot begin with uppercase letters 
-- when function does not take ant parameters we usually say
-- it is aa definition (or a name) - cos jak zmienna

-- in Haskell lists are homogenous data structures;
-- it stores several elements of the same type 

-- Note: We can use the let keyword to define a name right in GHCI. Doing let a = 1 inside 
-- GHCI is the equivalent of writing a = 1 in a script and then loading it

lostNumbers = [4, 8, 15, 16, 23, 42]

-- string are just lists of characters -> hello is jus synthetic sugar for ['h', 'e', 'l', 'l', 'o']
-- because string are lists, we can use list functions on them, which is really handy

-- puttin two list together 
-- [1, 2, 3, 4] ++ [9, 10, 11, 12]

-- "hello" + " " ++ "world"

-- when you put together two lists (even if you append a singleton list to a list, for instance [1, 2, 3] ++ [4])
-- internally Haskell has to walk through the whole list on the left side of ++
-- thaths not a problem when dealing with lists that aren't too big;
-- but putting something at the end of a list that's fifty milition entries long is going to take 
-- a while; However, putting something at the beginninge o f a list using the : operator 
-- (also called the cons operator) is instantaneous
-- 'A':" Small cat"
-- 5:[1, 2, 3 ,4, 5]


-- [1, 2, 3] is actually just syntatic sugar for 1:2:3:[]


-- [], [[]] and [[], [], []] are all diffrent things, the first one is an empty list, the seconds one is a list 
-- that contains one empty list, the third on e is a list that contains three empty lists 

-- If you want to get an element out of a list by index use !!, the indicies start at 0

-- [[1, 2, 3, 4], [5, 6, 6]]

-- The lists within a list can ba of diffrent lengths but, they can't be of diffrent types 

-- Lists can be compared if the stuff they contain can be compared 
-- when using <, <=, > and >= to compare lists, they are compared in 
-- in lexicographical order, first the heads are compared, if they are 
-- equal then the second elements are compared etd 
-- [3, 2, 1] > [2, 1, 0]

-- Other functiosn for lists:

-- head - takes a list and returns its head
-- head [5, 4, 3, 2, 1]

-- tail - it chops off a lists's head 
-- tails [5, 4, 3, 2, 1]
-- > [4, 3, 2, 1]

-- last-  takes a list and returns its last element
-- init - takes a list and returns everything except its last element
-- init [5, 4, 3, 2, 1]
-- > [5, 4, 3, 2]

-- length - takes a list and returns its length, obviously

-- null checks if a list is empty; if it is, it returns True, otherwise it returns False; 
    -- Use this function instead of xs == [] 
-- null [1, 2, 3]

-- reverse - reverses a list 

-- take - it extracts that many elements from the beginning of the list 
-- take 3 [5, 4, 3, 2, 1]
-- > [5, 4, 3]

-- drop - works in a similar way as take but it drops the number of elements from the beginnign of a list 

-- drop 3 [8, 4, 2, 1, 5, 6]
-- [1, 5, 6]

-- maximum - returns the biggest element
-- minimum - returns the smallest 
-- sum - takes a list of numbers and returns their sum 

-- product - takes a list of numbers and returns their product (mnozenie element po elemencie)
--- product [6, 2, 1, 2]
-- 24 

-- elem - takes a thing and a list of things tells us if that thing is an element of the list 
-- usually called as infix function -> easier to read 
-- 4 `elem` [3, 4, 5, 6]
-- True

-- to make a list containign all the natural numbers from 1 to 20, you just
-- write [1..20]

-- ['a'..'z']

-- you can also specify a step for a range 
-- [2, 4..20]
-- [step, first_element..last_lement]

-- watch out when using floating point numbers in ranges; because they are not 
-- completly precise (by definition) theith use in ranges yield some pretty funky results


-- you can also use ranges to make infinite list by just no specyfing an upper limit
-- take 24 [13, 26..] # 24 multiples of 13

-- cycle - takes a list and cycles it into an infinite list; if you just try to display the result, it will go 
-- on forever so you have to sliceit ogg somewhere 
-- take 10 (cycle [1, 2, 3])
-- > [1,2,3,1,2,3,1,2,3,1]

-- repeat - takes an element and produces it into an infinite list of just that element; 
-- it is like cycling a list with only one element
-- take 10 (repeat 5)

-- replicate 3 10 
-- > [10, 10, 10]

-- [x*2 | x <- [1..10]] x is drawn from [1..10] and for every element in [1..10] (which we have bound to x)
-- we get that element, only doubled
-- [x* 2 | x <- [1..10]]
-- > [2,4,6,8,10,12,14,16,18,20]


-- we can add a predicate to this -> e.g we want only the elements which, doubled  are greated than or
-- equal to 12

-- [x*2 | x <- [1..10], x*2 >= 12]
-- [12,14,16,18,20]

-- weeding out lists by predicates is also called filtering 

-- if a number is not odd we throw it out of our list 

boomBangs xs = [if x < 10 then "Boom!" else "Bang!" | x <- xs, odd x]

-- the last part of the comprehension above is the predicate 

-- we cane include several predicates 
-- [x | x <- [10..20], x /= 13, x /= 15, x /= 19]
-- [10,11,12,14,16,17,18,20]

-- we can also drawn from several lists 
-- when drawning from several lists, comprehensions produce all
-- combinations of the given lists and then join them by output function we supply 
-- a lists (iloczyn karteznajnski) produced by a comprehension that drawn from two 
-- lists of length 4 will habe a length of 16 (provided we do not filter)
-- [x * y | x <- [2, 5, 10], y <- [8, 10, 11]] -- iloczyn kartezjanski
-- with filtering 
-- [x * y | x <- [2, 5, 10], y <- [8, 10, 11], x * y > 50]


-- we can use comprehensiosn to the string (they are obviously a list of chars): 
removeNonUppercase st = [c | c <- st, c `elem` ['A'..'Z']]

-- nested list comprehensiosn are also possible if you are 
-- operating on lists that contain lists 
-- [[1, 3, 5, 2, 3, 1, 2, 4, 5], [1, 2, 3, 4, 5, 6, 7, 8, 9]]
-- [ [x | x <- xs, even x] | xs <- xss ]


-- tuples are used when you know exactly how many
-- values you want to combine and its type depends on how many components it has and the types of the componentns

-- tupes don't have to be homogenous 
-- e.g [(1, 2), (8, 11), (4, 5)]
-- (1, 2) type is not the same as (8, 11, 5) type

-- like lists, tuples can be compared with each other if their
-- components can be compared 
-- you can't compare tuples of diffrent sizes

-- Two useful functions that operates on pairs: 
-- fst - takes a pair and returns its first element
-- snd - takes a pair nad returns its second component

-- Cool function 
-- zip - it takes two lists and then zips them together into one list 
-- by joining the matching elements into pairs 
-- ghci> zip [1, 2, 3, 4,5] [5,5,5,5,5]
-- [(1,5),(2,5),(3,5),(4,5),(5,5)]

-- if the lengths of lists does not match the longer list simply gets cut off

-- beacause Haskell is lazy, we can zip finite lists with infinite lists : 
-- zip [1..] ["apple", "orange", "cherry", "mango"]

triangles = [(a, b, c) | c <- [1..10], b <- [1..10], a <- [1..10]]
-- list of all possible triangles with sides under or equal to 10

rightTriangles = [(a, b, c) | c <- [1..10], b <- [1..10], a <- [1..10], a^2 + b ^2 == c^2]

-- a common pattern in functional programming is to take a starting set of solutions
-- and then  apply transformations to those solutions and filter them 
-- until you get the right ones
