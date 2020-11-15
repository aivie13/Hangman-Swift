//
//  main.swift
//  Hangman
//
//  Created by Aaron Ivie on 11/14/20.
//
var words = ["rainbow", "computer", "science", "programming",
             "python", "mathematics", "player", "condition",
             "reverse", "water", "board", "geeks"]
var man1 = "   o"
var man2 = """
   o
   |
"""
var man3 = """
   o
   |-
"""
var man4 = """
   o
  -|-
"""
var man5 = """
   o
  -|-
   \\
"""
var man6 = """
   o
  -|-
   /\\
"""

var word = words.randomElement()!

var guesses = Set<Character>()
var chances = 6
var unguessed:Int

while chances >= 0{
   unguessed = word.count
   for char in word{
      if guesses.contains(char) {
         print(char, terminator:"")
         unguessed-=1
         if unguessed==0{
            print("\rYou win!")
            print("Word is \(word)")
            break
         }
      }else{
         print("_", terminator:"")
      }
   }
   switch chances {
   case 6:
      print("",terminator:"")
   case 5:
      print()
      print(man1)
   case 4:
      print()
      print(man2)
   case 3:
      print()
      print(man3)
   case 2:
      print()
      print(man4)
   case 1:
      print()
      print(man5)
   case 0:
      print("\rOut of chances, you lose.")
      print("The word was \(word).")
      print(man6)
      break
   default:
      print("invalid chance number")
      break
   }
   print("\r\rGuess a letter: ", terminator:"")
   let guess = Character(readLine()!)
   
   if word.contains(guess){
      guesses.insert(guess)
      
   }else{
      chances-=1
      print("\rWrong, you have", chances, "more chances.\r")
   }
}

