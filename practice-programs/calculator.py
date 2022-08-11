from cs50 import get_int

# x = get_int("x: ")
# y = get_int("y: ")
# print(x + y)


# x = int(input("x: "))
# y = int(input("y: "))
# print(x + y)

# try:
#     x = int(input("x: "))
# except ValueError:
#     print("That is not an int!")
#     exit()
# try:
#     y = int(input("y: "))
# except ValueError:
#     print("That is not an int!")
#     exit()
# print(x + y)

x = int(input("x: "))
y = int(input("y: "))
z = x / y  #This will give you a decimal
# z = x // y #This will return an int.
print(z) # With precision
print(f"{z:.1f}")