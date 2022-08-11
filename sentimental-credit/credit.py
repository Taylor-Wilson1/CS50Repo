def main():
    try:
        card_number = int(input("What is your credit card number?: "))

    except ValueError:
        print("That is not an int!")
        exit()

    num = num_Of_Digits(card_number)
    sum = check_sum(card_number)
    card_type = credit_card_type(card_number, num, sum)

    print(check_sum(card_number))
    print(num)
    print(card_type)


def num_Of_Digits(card_number):
    counter = 0

    while card_number != 0:
        card_number = card_number // 10
        counter += 1

    return counter


def check_sum(card_number):
    counter = 0
    sum_Odd = 0
    sum_Even = 0
    digit = 0

    while card_number > 0:
        if counter % 2 == 1:
            digit = card_number % 10
            num = digit * 2

            if num > 9:
                x = num % 10
                y = num // 10
                num = x + y
            sum_Odd = sum_Odd + num
        else:
            digit = card_number % 10
            sum_Even = sum_Even + digit

        card_number = card_number // 10
        counter += 1

    return sum_Odd + sum_Even


def credit_card_type(card_number, num_digits, check_sum):
    string_type = ""
    counter = 0
    valid = False

    if num_digits == 15:
        while counter <= 14:
            if card_number == 34 or card_number == 37:
                string_type = "AMEX"
                valid = True
            card_number = card_number // 10
            counter += 1

    else:
        if num_digits == 16 or num_digits == 13:
            while counter <= 16:
                if ((num_digits == 16) and (((card_number == 51) or (card_number == 52) or (card_number == 53) or (card_number == 54) or (card_number == 55)))):
                    string_type = "MASTERCARD"
                    valid = True
                    break
                if (((num_digits == 16) or ((num_digits == 13))) and (card_number == 4)):
                    string_type = "VISA"
                    valid = True
                card_number = card_number // 10
                counter += 1

    if check_sum % 10 == 0 and valid == True:
        return string_type
    else:
        return "INVALID"


if __name__ == "__main__":
    main()