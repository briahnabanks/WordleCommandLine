//
//  main.swift
//  wordle
//
//  Created by Briahna Banks on 11/13/24.
//

var words = ["match", "crazy" , "juicy" , "cobra" , "apple" , "bread" , "blank" , "juice" , "irony" , "enjoy" , "phone" , "prize" , "sharp" , "share" , "stand" , "rough" , "today" , "spend" , "quiet" , "speed" , "rival" , "score" , "scope" , "ratio" , "raise" , "reach" , "rural" , "rapid" , "phase" , "pride" , "prime" , "topic" , "stage" , "trend" , "table" , "store" , "under" , "solve" , "teach" , "stone" , "train" , "young" , "stock" , "stalk" , "worse" , "video" , "whole" , "track" , "sport" , "alive" , "begin" , "abuse" , "alone" , "below" , "admit" , "above" , "birth" , "block" , "cover" , "audit" , "alter" , "amend" , "bound" , "album" , "giant" , "drink" , "dream" , "false" , "heavy" , "night" , "image" , "empty" , "house"] //wordbank

var correctWord = ""

var gameOver = false
//
if let randomWord = words.randomElement() {
    correctWord = randomWord //selects random word
    
    
}
    print("""
Welcome to Wordle! \n
Instructions: Try to correctly guess the 5 letter word.
You have 5 attempts. 
*HINT* The correct word will not duplicate letters. \n
Enter your 5 letter guess:
""")
    
    var guess = ""


var numOfTries = 0
let guessArray = Array(guess)
let correctWordArray = Array(correctWord)

var characters = [String: Set<String>]() //dictionary where the key is a string, value is a set of strings
characters["incorrect"] = []
characters["correct"] = []
 

while !gameOver {
   
    if let realguess = readLine() { //reads input from user
        
        guess = realguess
    }
        if guess.count < 5 {
            var difference =  5 - guess.count
            for number in 0...difference {
                guess += "."
                
            }
        }
        //        Allows only 5 characters to be read from guess
        let startIndex = guess.startIndex
        let desiredLength = guess.index(guess.startIndex, offsetBy: 4)
        let userInput = guess[startIndex...desiredLength]
        guess = String(userInput) // turns substring back into string
        
        
        
        
        
        let guessArray = Array(guess)
        let correctWordArray = Array(correctWord)
        
        guessArray.enumerated().forEach {
            (index, letter) in //looping over guess array accessing each letter and position
            
            if correctWordArray.contains(letter) {
                
                characters["correct"]?.insert("\(letter)")
                
                if guessArray[index] == correctWordArray[index] {
                    
                    print("\(letter) was found in the correct spot. \n")
                    
                } else {
                    print("\(letter) is in the word, but incorrect spot. \n")
                    
                    
                }
            } else  {
                print("\(letter) not in the word. \n")
                characters["incorrect"]?.insert("\(letter) ")
        
            }
            
        
       
        }
       
        if guessArray == correctWordArray {
            print("Congrats! You guessed the word correctly. ")
            gameOver = true
            
        }
        
       else if guessArray != correctWordArray {
            print("\(guess) is incorrect. Try again. \n")
            //                print("Letters used: \(guessArray)")
            print("Incorrect letters guessed: \(characters["incorrect"] ?? [])")
            
            
            print("Correct chracters guessed: \(characters["correct"] ?? [])")
        }
        numOfTries += 1
        print("Attempt: \(numOfTries) \n")
        
    if numOfTries == 5 &&  guessArray != correctWordArray {
print("Uh-oh! You have ran out of attempts. GAME OVER! Correct word is:\(correctWord)")
        gameOver = true
        }
   
    
        }
        
        
        
        






