#include <cs50.h>
#include <stdio.h>

int main(void)
{
    //Prompt user for height of pyramid
    int height = 0;

    do
    {
        height = get_int("Provide a positive # between 1 and 8: ");
    }
    while ((height > 8) || (height < 1));

    // Need to make a row
    for (int i = 0; i < height; i++)
    {
        // Need to add spaces
        for (int m = height - i; m > 1; m--)
        {
            printf(" ");
        }

        // Need to make a column
        for (int j = 0; j <= i; j++)
        {
            printf("#");
        }

        printf("  ");

        for (int k = 0; k <= i; k++)
        {
            printf("#");
        }

        printf("\n");
    }
}
