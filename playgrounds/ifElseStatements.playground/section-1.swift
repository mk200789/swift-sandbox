// Playground - noun: a place where people can play

import UIKit

//If statements

var age = 20

/*
In swift 2

if age >= 18 {
    print("You can play!")
}....
*/


if (age >= 18) {
    print("You can play!")
}else{
    print("Sorry, you're too young.")
}

var name = "Kim"

if (name == "Kim"){
    print("Hi \(name) you can play!")
}else{
    print("Sorry, \(name) you can't play :(")
}


/* 
Combined if statements with && and ||
*/

if (name == "Kim" && age >= 18){
    print ("Hi \(name)! You can play with us.")
}

if (name == "Jimmy" || name == "Dandylion"){
    print("Welcome \(name)")
}


var isFemale = true

if (isFemale){
    print("You are a woman")
}


/*
Challange for myself
*/

var username = "Adam" //"coolkitty"
var password = 12345

if (username == "coolkitty" && password == 12345){
    print("You are in")
}else if (username != "coolkitty" && password == 12345){
    print("Invalid username")
}else if (username == "coolkitty" && password != 12345){
    print("Invalid password")
}else{
    print("Invalid password and username")
}