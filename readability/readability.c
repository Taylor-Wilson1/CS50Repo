#include <cs50.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <math.h>

int count_letters(string text);
int count_words(string text);
int count_sentences(string text);
int calc_grade_lvl(int letters, int words, int sentences);

int main(void)
{
    //Prompt user for string
    string text = get_string("Provide Text: ");
    //string grade_lvl = "";

    int letters = count_letters(text);
    int words = count_words(text);
    int sentences = count_sentences(text);
    int grade_lvl = calc_grade_lvl(letters, words, sentences);

    //Write an if statement for Grade Level 16+
    //printf("Grade X %s", grade_lvl);

    if (grade_lvl < 1)
    {
        printf("Before Grade 1\n");
    }
    else if (grade_lvl > 16)
    {
        printf("Grade 16+\n");
    }
    else
    {
        printf("Grade %i\n", grade_lvl);
    }
    printf("%i \n", letters);
    printf("%i \n", words);
    printf("%i \n", sentences);
    printf("%i \n", grade_lvl);

}

//Count the number of letters
int count_letters(string text)
{
    int counter = 0;

    // Make a loop that runs through the text
    // Loops through each character
    for (int i = 0; i < strlen(text); i++)
    {
        if (islower(text[i]) || isupper(text[i]))
        {
            counter++;
        }
    }

    return counter;
}

//Count the number of words in a sentence
int count_words(string text)
{
    int counter = 0;

    for (int i = 0; i < strlen(text); i++)
    {
        if (text[i] == ' ')
        {
            counter++;
        }
    }

    return counter + 1;
}

//Count the number of sentences in the text.
int count_sentences(string text)
{
    int counter = 0;

    for (int i = 0; i < strlen(text); i++)
    {
        if (((text[i]) == '?') || ((text[i]) == '!') || ((text[i]) == '.'))
        {
            counter++;
        }
    }

    return counter;
}

//Calculate Grade Level
int calc_grade_lvl(int letters, int words, int sentences)
{
    float L = ((float) letters / (float) words) * 100;
    float S = ((float) sentences / (float) words) * 100;
    float first_part = 0.0588 * L;
    float second_part = 0.296 * S;
    float combine = first_part - second_part;
    int index = roundf(combine - 15.8);

    return (index);
}
