Various logic puzzles explained and solved with prolog. 

# Useful links
swi-prolog: http://www.swi-prolog.org/

# "Einstein's riddle"  
source: https://udel.edu/~os/riddle.html 

## The situation

1. There are 5 houses in five different colors.
2. In each house lives a person with a different nationality.
3. These five owners drink a certain type of beverage, smoke a certain brand of cigar and keep a certain pet.
4. No owners have the same pet, smoke the same brand of cigar or drink the same beverage.
5. The question is: Who owns the fish?

## Hints

- the Brit lives in the red house
- the Swede keeps dogs as pets
- the Dane drinks tea
- the green house is on the left of the white house
- the green house's owner drinks coffee
- the person who smokes Pall Mall rears birds
- the owner of the yellow house smokes Dunhill
- the man living in the center house drinks milk
- the Norwegian lives in the first house
- the man who smokes blends lives next to the one who keeps cats
- the man who keeps horses lives next to the man who smokes Dunhill
- the owner who smokes BlueMaster drinks beer
- the German smokes Prince
- the Norwegian lives next to the blue house
- the man who smokes blend has a neighbor who drinks water

## Usage  

[have swi-prolog installed] 
git clone https://github.com/sandrolovnicki/logic-puzzles.git [or download zip]
cd logic-puzzles
swipl
?- [einstein].
?- solution(X).
