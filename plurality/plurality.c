#include <cs50.h>
#include <stdio.h>
#include <string.h>

// Max number of candidates
#define MAX 9

// Candidates have name and vote count
typedef struct
{
    string name;
    int votes;
}
candidate;

// Array of candidates
candidate candidates[MAX];

// Number of candidates
int candidate_count;

// Function prototypes
bool vote(string name);
void print_winner(void);

int main(int argc, string argv[])
{
    // Check for invalid usage
    if (argc < 2)
    {
        printf("Usage: plurality [candidate ...]\n");
        return 1;
    }

    // Populate array of candidates
    candidate_count = argc - 1;
    if (candidate_count > MAX)
    {
        printf("Maximum number of candidates is %i\n", MAX);
        return 2;
    }
    for (int i = 0; i < candidate_count; i++)
    {
        candidates[i].name = argv[i + 1];
        candidates[i].votes = 0;
    }

    int voter_count = get_int("Number of voters: ");

    // Loop over all voters
    for (int i = 0; i < voter_count; i++)
    {
        string name = get_string("Vote: ");

        // Check for invalid vote
        if (!vote(name))
        {
            printf("Invalid vote.\n");
        }
    }

    // Display winner of election
    print_winner();
}

// Update vote totals given a new vote
/*
   If candidates.name = name ---> strcmp(candidates[i], name)
        Update Candidates vote Candidates[i].vote ++;
        return true;
    else
    return false
*/

bool vote(string name)
{
    bool candidates_vote = false;

    for (int i = 0; i < candidate_count; i++)
    {
        if (strcmp(candidates[i].name, name) == 0)
        {
            candidates[i].votes ++;
            candidates_vote = true;
        }
    }
    return candidates_vote;
}

// Print the winner (or winners) of the election
void print_winner(void)
{
    int high = 0;
    //string winner = "";

    for (int i = 0; i < candidate_count; i++)
    {
        if (candidates[i].votes > high)
        {
            high = candidates[i].votes;
        }
    }

    for (int j = 0; j < candidate_count; j++)
    {
        if (candidates[j].votes == high)
        {
            printf("%s\n", candidates[j].name);
        }
    }

    //printf("%s", winner);
}

// if (candidates[i].votes > )
//         {
//             printf("%s", candidates[i].name);
//         }
