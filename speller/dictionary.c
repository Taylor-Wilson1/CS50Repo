// Implements a dictionary's functionality

#include <ctype.h>
#include <stdbool.h>

#include "dictionary.h"

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <cs50.h>
#include <string.h>
#include <strings.h>


// Represents a node in a hash table
typedef struct node
{
    char word[LENGTH + 1];
    struct node *next;
}
node;

// TODO: Choose number of buckets in hash table
const unsigned int N = 26;
unsigned int word_counter = 0;
unsigned int hash_number = 0;

// Hash table
node *table[N];


// Returns true if word is in dictionary, else false
bool check(const char *word)
{
    // TODO
    // Case insensitive
    // Return true if the word is in the dictionary, false otherwise
    // Hash word to obtain a value
    hash_number = hash(word);
    bool in_dictionary = false;
    node *n = table[hash_number];




    // Access linked list at that indext in the hash table
    //n = table[hash_number];

    // Traverse linked list, looking for the word (strcasecmp)
    while (n != 0)
    {
        if (strcasecmp(word, n->word) == 0)
        {
            // in_dictionary = true;
            return true;
        }

        n = n->next;
    }

    // return in_dictionary;
    return false;
}

// Hashes word to a number
unsigned int hash(const char *word)
{
    // TODO: Improve this hash function
    // Hash Function:
        // Input: word, with alphabetical characters and (possibly) apostrophes
        // Output: Numberical Index between 0 & N - 1, inclusive
        // Deterministic - If you put the same input in, you should receive the same output
    // Larger N means more buckets

    unsigned long sum = 0;

    for (int i = 0; i < strlen(word); i++)
    {
        sum += toupper(word[i]);
    }

    // If your function ends up with a value greater than N, you can take the value
    // % N to get a value in the appropriate range
    return sum % N;
}

// Loads dictionary into memory, returning true if successful, else false
bool load(const char *dictionary)
{
    // TODO
    //Responsible for taking the dictionary & loading it into a hash table
    //Open up the Dictionary file & read from it in order to put into the hash table
        //Return true if successful

    // Allocate memory for a new node
    // node *n = malloc(sizeof(node));
    // n->next = NULL;

    // How to put data into that node
    // strcpy(n->word, "Hello");


    // Open Dictionary file
        // Use fopen
        // Remember to check if return is NULL
        // Return False if opening the file is not successful
        FILE *file = fopen(dictionary, "r");
        char word[LENGTH + 1];
        //node *n = malloc(sizeof(node));

        if (file == NULL)
        {
            printf("Unable to open %s\n", dictionary);
            return false;
        }
    // Read strings from file one at a time
        // fscanf(file, "%s", word)
            // file: file pointer. The result of calling fopen in the dictionary
            // "%s": Read in a string
            // Word: Some character array. Some place you are going to read the word into
        // Repeat this again and again and again for each word in the dictionary until it returns EOF (End of File)
        while (fscanf(file, "%s", word) != EOF)
        {
            // Create a new node for each word
                // Use Malloc
                // Check if return value is NULL
            node *n = malloc(sizeof(node));
            // n->next = NULL;

            if (n == NULL)
            {
                return false;
            }

            // How to put data into that node
            //Copy the word into node using strcpy
            strcpy(n->word, word);

            // Hash word to obtain a hash value
                // Use the hash function
                //Function takes a string and returns an index
            hash_number = hash(word);

            // Insert node into hash table at that location
            n->next = table[hash_number];
            table[hash_number] = n;
            word_counter++;
        }

        fclose(file);
        //free(n);
        return true;
}

// Returns number of words in dictionary if loaded, else 0 if not yet loaded
unsigned int size(void)
{
    // TODO
    if (word_counter > 0)
    {
        return word_counter;
    }
    return 0;
}

// Unloads dictionary from memory, returning true if successful, else false
bool unload(void)
{
    // TODO
    for (int i = 0; i < N; i++)
    {
        node *n = table[i];

        while (n)
        {
            node *temp = n;
            n = n->next;
            free(temp);
        }

        if (n == NULL)
        {
            return true;
        }
    }
    return false;
}
