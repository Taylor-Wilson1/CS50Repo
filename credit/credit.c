#include <cs50.h>
#include <stdio.h>

//Prototypes
string credit_card_type(long card_number, int num_digits, int check_sum);
int check_sum(long card_number);
int num_Of_Digits(long card_number);
// string validation(int check_sum, string type);

int main(void)
{
    //Variables
    long card_number = get_long("What is your credit card number?: ");
    int num = num_Of_Digits(card_number);
    int sum = check_sum(card_number);
    string card_type = credit_card_type(card_number, num, sum);

    //printf("%s\n", credit_card_type(num));
    printf("%i\n", check_sum(card_number));
    printf("%i\n", num);
    printf("%s", card_type);
    printf("\n");
}

//Determines TYPE of card
//American Express - Starts with 34 or 37 & has 15 digits
//Mastercard - Starts with 51, 52, 53, 54, or 55 & has 16 digits
//Visa - Starts with 4 & has 13 or 16 digits
//credit_card_type()
string credit_card_type(long card_number, int num_digits, int check_sum)
{
    string type = "";
    int counter = 0;
    bool valid = false;

    if (num_digits == 15)
    {
        while (counter <= 14)
        {
            if ((card_number == 34) || (card_number == 37))
            {
                type = "AMEX";
                valid = true;
            }

            card_number = card_number / 10;
            counter++;
        }
    }

    else if ((num_digits == 16) || (num_digits == 13))
    {
        while (counter <= 16)
        {
            if ((num_digits == 16) && (((card_number == 51) || (card_number == 52) || (card_number == 53) || (card_number == 54)
                                        || (card_number == 55))))
            {
                type = "MASTERCARD";
                valid = true;
                break;
            }

            if (((num_digits == 16) || ((num_digits == 13))) && (card_number == 4))
            {
                type = "VISA";
                valid = true;
            }

            card_number = card_number / 10;
            counter++;
        }
    }

    if ((check_sum % 10 == 0) && (valid == true))
    {
        return type;
    }
    else
    {
        return "INVALID";
    }
}

//Multiplies every other digit by 2, starting with second to last digit
//Then add those product digits together
//Add the sum to the digits of the digits that weren't multiplied by 2
//If the last digit is 0, the number is valid
//Ex: 400360000000014
//Checksum
int check_sum(long card_number)
{
    int counter = 0;
    int sum_Odd = 0;
    int sum_Even = 0;
    int digit = 0;

    while (card_number > 0)
    {
        //if counter is odd
        if (counter % 2 == 1)
        {
            digit = card_number % 10;
            int num = digit * 2;

            if (num > 9)
            {
                int x = num % 10;
                int y = num / 10;

                num = x + y;
            }

            sum_Odd = sum_Odd + num;
        }

        else
        {
            digit = card_number % 10;
            sum_Even = sum_Even + digit;
        }

        card_number = card_number / 10;
        counter++;
    }

    return sum_Odd + sum_Even;
}


//Calculates how many digits are in a card
int num_Of_Digits(long card_number)
{
    int counter = 0;

    while (card_number != 0)
    {
        card_number = card_number / 10;
        counter ++;
    }

    return counter;
}

