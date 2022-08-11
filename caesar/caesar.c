#include <cs50.h>
#include <stdio.h>

int main(int argc, string argv[])
{
    //no command line
    //2 or more
    //Print "Usage: ./caesar key\n" then return 1
    printf(" %s\n", argv[1]);

    if(argc == 2)
    {
        printf("Usage: ./caesar key\n");
        return 1;
    }
    else
    {
        printf("Usage: ./caesar key\n");
    }
}