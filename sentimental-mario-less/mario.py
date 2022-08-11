from cs50 import get_int

while(True):
    try:
        height = int(input("Provide a positive # between 1 and 8: "))


        if height <= 8 and height >= 1:
            break


    except ValueError:
        print("That is not an int!")
        exit()


k = height - 1
j = 0

for i in range(height):
    for k in range(height - 1, i, -1):
         print(" ", end = "")
    for j in range(0, i + 1, 1):
        print("#", end="")
    print()


# for j in range(i,height,1):

# for i in range(height):
#     for k in range(height - 1, 0, -1):
#          print(" ", end = "")
#     for j in range(i):
#         print("#", end="")
#     print()


# Upside down Triangle
# for i in range(height):
#     for k in range(height - 1, 0, -1):
#          print(" ", end = "")
#     for j in range(i,height,1):
#         print("#", end="")
#     print()


# try:
#     y = int(input("y: "))
# except ValueError:
#     print("That is not an int!")
#     exit()
# print(x + y)