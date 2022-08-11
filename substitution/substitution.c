#include <cs50.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>


void encryption(string key, string plaintext);
bool key_validation(string key);

int main(int argc, string argv[])
{
    string key = argv[1];
    int n = strlen(key);
    //bool validation = key_validation(key);
    bool validation = NULL;
    //printf(" %s\n", argv[1]);


    if (argc == 2 && (strlen(key) == 26))
    {
        string plaintext = get_string("plaintext:  ");
        printf("ciphertext: ");
        encryption(key, plaintext);
        printf("\n");
        return 0;
    }
    else
    {
        printf("Usage: ./substitution key\n");
        return 1;
    }

/*
    string key = get_string("Key: ");
    int n = strlen(key);
    bool validation = key_validation(key);

    string plaintext = get_string("plaintext:  ");
    printf("ciphertext: ");
    encryption(key, plaintext);
    printf("\n");
    -------------------------
    if(strlen(key) == 26)
    {
        string plaintext = get_string("plaintext:  ");
        printf("ciphertext: ");
        encryption(key, plaintext);
        printf("\n");
        return 0;
    }
    else
    {

    }

*/
}

//Make a function that encrypts plaintext

void encryption(string key, string plaintext)
{
    char ALPHABET[] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
    char ciphertext[strlen(plaintext)];

    for (int i = 0; i < strlen(plaintext); i++)
    {
        for (int k = 0; k < strlen(key); k++)
        {
            if (isupper(plaintext[i]) && (plaintext[i] == ALPHABET[k]))
            {
                key[k] = toupper(key[k]);
                ciphertext[i] = key[k];
                printf("%c", ciphertext[i]);
                break;
            }
            else if (islower(plaintext[i]) && (plaintext[i] == tolower(ALPHABET[k])))
            {
                key[k] = tolower(key[k]);
                ciphertext[i] = key[k];
                printf("%c", ciphertext[i]);
                ALPHABET[k] = toupper(ALPHABET[k]);
                break;
            }
            else if ((isdigit(plaintext[i])) || (isalpha(plaintext[i]) == 0))
            {
                printf("%c", plaintext[i]);
                break;
            }
        }
    }
}

//Check to see if key is valid. Key must have 26 characters
//print error message if not valid
bool key_validation(string key)
{
    int n = strlen(key);
    char UPPER_ALPHABET[] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
    char LOWER_ALPHABET[] = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
    bool validation = NULL;

    for (int i = 0; i < n; i++)
    {
        for (int k = 0; k < n; k++)
        {
            if ((key[i] != UPPER_ALPHABET[k]) || (key[i] != LOWER_ALPHABET[k]))
            {
                validation = false;
            }
            else if (key[i] == key[k])
            {
                validation = false;
                break;
            }
            else
            {
                validation = true;
            }
        }
    }
    return validation;
}
