from cs50 import get_string

c = str(input("Do you agree? "))

if c == "Y" or c == "y":
    print("Agreed")
elif c == "N" or c == "n":
    print("Did Not Agree")