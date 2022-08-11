#include "helpers.h"
#include <math.h>
#include <stdbool.h>
#include <stdio.h>

//void swap(RGBTRIPLE image[height][width]);

// Convert image to grayscale
void grayscale(int height, int width, RGBTRIPLE image[height][width])
{
    float average = 0;
    int new_number = 0;

    for (int i = 0; i < height; i++)
    {
        for (int k = 0; k < width; k++)
        {
            average = (image[i][k].rgbtBlue + image[i][k].rgbtRed + image[i][k].rgbtGreen) / 3.0;
            new_number = round(average);
            image[i][k].rgbtBlue = new_number;
            image[i][k].rgbtRed = new_number;
            image[i][k].rgbtGreen = new_number;
        }
    }
    return;
}

// Convert image to sepia
void sepia(int height, int width, RGBTRIPLE image[height][width])
{

    float sephiaRed = 0;
    float sephiaGreen = 0;
    float sephiaBlue = 0;

    int rounded_sephiaRed = 0;
    int rounded_sephiaGreen = 0;
    int rounded_sephiaBlue = 0;

    int originalRed = 0;
    int originalGreen = 0;
    int originalBlue = 0;

    int temp_red = 0;

    for (int i = 0; i < height; i++)
    {
        for (int k = 0; k < width; k++)
        {
            originalRed = image[i][k].rgbtRed;
            originalGreen = image[i][k].rgbtGreen;
            originalBlue = image[i][k].rgbtBlue;

            sephiaRed = (.393 * originalRed) + (.769 * originalGreen) + (.189 * originalBlue);
            sephiaGreen = (.349 * originalRed) + (.686 * originalGreen) + (.168 * originalBlue);
            sephiaBlue = (.272 * originalRed) + (.534 * originalGreen) + (.131 * originalBlue);

            rounded_sephiaRed = round(sephiaRed);
            rounded_sephiaGreen = round(sephiaGreen);
            rounded_sephiaBlue = round(sephiaBlue);

            //Cap Values at 255 if they are > than 255
            if (rounded_sephiaRed > 255)
            {
                //image[i][k].rgbtRed = 255;
                rounded_sephiaRed = 255;
            }

            if (rounded_sephiaGreen > 255)
            {
                //image[i][k].rgbtGreen = 255;
                rounded_sephiaGreen = 255;
            }

            if (rounded_sephiaBlue > 255)
            {
                //image[i][k].rgbtBlue = 255;
                rounded_sephiaBlue = 255;
            }

            image[i][k].rgbtRed = rounded_sephiaRed;
            image[i][k].rgbtGreen = rounded_sephiaGreen;
            image[i][k].rgbtBlue = rounded_sephiaBlue;

            //Swap Red
            //swap(&originalRed, &rounded_sephiaRed);
            // temp_red = originalRed;
            // originalRed = rounded_sephiaRed;
            // rounded_sephiaRed = temp_red;

            // //Swap Green
            // int temp_green = originalGreen;
            // originalGreen = rounded_sephiaGreen;
            // rounded_sephiaGreen = temp_green;

            // //Swap Blue
            // int temp_blue = originalBlue;
            // originalBlue = rounded_sephiaBlue;
            // rounded_sephiaBlue = temp_blue;
        }
    }

    return;
}

// Reflect image horizontally
void reflect(int height, int width, RGBTRIPLE image[height][width])
{
     RGBTRIPLE temp[height][width];
     int location = 0;
     bool is_even = false;

    if (width % 2 == 0)
    {
        is_even = true;
    }

    for (int i = 0; i < height; i++)
    {
        for (int k = width - 1; k >= 0; k--)
        {
            temp[i][k].rgbtRed = image[i][k].rgbtRed;
            temp[i][k].rgbtGreen = image[i][k].rgbtGreen;
            temp[i][k].rgbtBlue = image[i][k].rgbtBlue;

            image[i][k].rgbtRed = image[i][location].rgbtRed;
            image[i][k].rgbtGreen = image[i][location].rgbtGreen;
            image[i][k].rgbtBlue = image[i][location].rgbtBlue;

            image[i][location].rgbtRed = temp[i][k].rgbtRed;
            image[i][location].rgbtGreen = temp[i][k].rgbtGreen;
            image[i][location].rgbtBlue = temp[i][k].rgbtBlue;
            location ++;

            if ((width / 2 == k) && is_even != true)
            {
                break;
            }
            if ((width / 2 == k) && is_even == true)
            {
                temp[i][k].rgbtRed = image[i][k].rgbtRed;
                temp[i][k].rgbtGreen = image[i][k].rgbtGreen;
                temp[i][k].rgbtBlue = image[i][k].rgbtBlue;

                image[i][k].rgbtRed = image[i][location].rgbtRed;
                image[i][k].rgbtGreen = image[i][location].rgbtGreen;
                image[i][k].rgbtBlue = image[i][location].rgbtBlue;

                image[i][location].rgbtRed = temp[i][k].rgbtRed;
                image[i][location].rgbtGreen = temp[i][k].rgbtGreen;
                image[i][location].rgbtBlue = temp[i][k].rgbtBlue;
                break;
            }
        }
        location = 0;
    }
    return;
}

// Blur image
// Copy image pixels into Copy
// Then Read pixel's colors from Copy
// Write (change) pixels's colors in image
void blur(int height, int width, RGBTRIPLE image[height][width])
{
    RGBTRIPLE copy[height][width];

    // Make Booleans to see if there is an upper or lower row
    bool is_corner = false;
    bool is_edge = false;
    bool is_middle = false;
    bool upper = false;
    bool lower = false;
    bool first = false;
    bool last = false;

    int avg_red = 0;
    int avg_green = 0;
    int avg_blue = 0;

    int sum_red = 0;
    int sum_green = 0;
    int sum_blue = 0;

    int calc_red = 0;
    int calc_green = 0;
    int calc_blue = 0;

    // Copy IMAGE into COPY
    for (int i = 0; i < height; i++)
    {
        for (int k = 0; k < width; k++)
        {
            copy[i][k] = image[i][k];
        }
    }

    //fread(copy[i][k], sizeof(RGBTRIPLE), 1, copy);

    // ------------------------------------------------------------------------------------------------------------
    //                                  |SETS UPPER, LOWER, FIRST, AND LAST |
    // ------------------------------------------------------------------------------------------------------------


    // ------------------------------------------------------------------------------------------------------------
    //                                  |Logic for MIDDLE, EDGE, & CORNER |
    // ------------------------------------------------------------------------------------------------------------

    // MIDDLE
    /*
       0 1 2   <--- Row     Starting with X (Current Pixel, (1, 1))
     0 * * *                Take the upper pixel of X (0,1) & take the left and right pixels of that position (0,0) & (0,2)
     1 * x *                Take the lower pixel of X (2,1) & take the left and right pixels of that position (2,0) & (2,2)
     2 * * *                Go back to X (1,1) and take the left and right pixels of X (1,0) (2,2)
     ^
     |
     Col
    */


    for (int i = 0; i < height; i++)
    {
        if (i > 0)
        {
            upper = true;
        }

        if (i != height - 1)
        {
            lower = true;
        }

        for (int k = 0; k < width; k++)
        {
            if (k == 0)
            {
                first = true;
            }

            if (k == width - 1)
            {
                last = true;
            }

            // Middle
            if((upper == true) && (lower == true) && (first == false) && (last == false))
            {
                // Upper Row - Middle
                sum_red += image[i - 1][k].rgbtRed;
                sum_green += image[i - 1][k].rgbtGreen;
                sum_blue += image[i - 1][k].rgbtBlue;

                // Upper Row - Left
                sum_red += image[i - 1][k - 1].rgbtRed;
                sum_green += image[i - 1][k - 1].rgbtGreen;
                avg_blue += image[i - 1][k - 1].rgbtBlue;

                // Upper Row - Right
                sum_red += image[i - 1][k + 1].rgbtRed;
                sum_green += image[i - 1][k + 1].rgbtGreen;
                sum_blue += image[i - 1][k + 1].rgbtBlue;

                // Lower Row - Middle
                sum_red += image[i + 1][k].rgbtRed;
                sum_green += image[i + 1][k].rgbtGreen;
                sum_blue += image[i + 1][k].rgbtBlue;

                // Lower Row - Left
                sum_red += image[i + 1][k - 1].rgbtRed;
                sum_green += image[i + 1][k - 1].rgbtGreen;
                avg_blue += image[i + 1][k - 1].rgbtBlue;

                // Lower Row - Right
                sum_red += image[i + 1][k + 1].rgbtRed;
                sum_green += image[i + 1][k + 1].rgbtGreen;
                sum_blue += image[i + 1][k + 1].rgbtBlue;

                // Left of Current Position
                sum_red += image[i + 1][k - 1].rgbtRed;
                sum_green += image[i + 1][k - 1].rgbtGreen;
                avg_blue += image[i + 1][k - 1].rgbtBlue;

                // Right of Current Position
                sum_red += image[i][k + 1].rgbtRed;
                sum_green += image[i][k + 1].rgbtGreen;
                sum_blue += image[i][k + 1].rgbtBlue;

                // Calc average
                calc_red = sum_red / 8.0;
                calc_green = sum_green / 8.0;
                calc_blue = sum_blue / 8.0;

                avg_red = round(calc_red);
                avg_green = round(calc_green);
                avg_blue = round(avg_blue);

                // Set Current Position
                image[i][k].rgbtRed = avg_red;
                image[i][k].rgbtGreen = avg_green;
                image[i][k].rgbtBlue = avg_blue;
            }
            // Edge
            // else if ()
            // {

            // }
            // // Corner
            // else
            // {

            // }

        }
    }


    // EDGE                 //First: Set if statements to check upper, lower, first, last
    /*
       0 1 2   <--- Row     Starting with X (Current Pixel, (0, 1))
     0 * x *                Check to see if X has a row above and below it  if height is 0 or if heiht is MAX, no row above or below
     1 * * *                   If X has a row above it, set boolean marker to TRUE & then.............
     2 * * *                    Take the upper pixel of X & take the left and right pixels of that position
     ^                          Go back to X (1,1) and take the left and right pixels of X (1,0) (1,2)
     |
     Col                        If X has a row below it, set boolean marker to TRUE & then.............
                                Take the lower pixel of X & take the left and right pixels of that position
                                Go back to X (1,1) and take the left and right pixels of X (1,0) (1,2)

                            Check to see if X is first or last in row       if x's index is 0 or x == width Ex: (0,x) (1,x) (2,x)
                                if first or last, a row MUST be above & below  if upper_row & lower_row == True & if x is first or last
                                    if x is first
                                        Take the upper pixel of X & take the right pixels of that position
                                        Take the lower pixel of X & take the right pixels of that position
                                        Go back to X and take the right pixel of X
                                    if x is last
                                        Take the upper pixel of X & take the left pixels of that position
                                        Take the lower pixel of X & take the left pixels of that position
                                        Go back to X and take the left pixel of X
    */

   // CORNER
    /*
       0 1 2   <--- Row     Starting with X (Current Pixel, (0, 1))
     0 * * *                Check to see if X is first or last in height  & first or last in Width  if x's index == 0 (x,#) or if x's index == height's MAX
     1 * * *                    if x is first in column & is first in row
     2 * * x                        Take the lower pixel of X & take the right pixel of that position
     ^                              Go back to X and take the right pixel of X
     |
     Col                        if x is first in column & is last in row
                                    Take the lower pixel of X & take the left pixel of that position
                                    Go back to X and take the left pixel of X

                                if x is last in column & is first in row
                                    Take the upper pixel of X & take the right pixel of that position
                                    Go back to X and take the right pixel of X

                                if x is last in column & is last in row
                                    Take the upper pixel of X & take the left pixel of that position
                                    Go back to X and take the left pixel of X
    */


    // To take the average of the colors
    // Add all of the (9,6, or 3 pixels) .rgbtRed together & divide it by (9,6,3)
    // Add all of the (9,6, or 3 pixels) .rgbtGreen together & divide it by (9,6,3)
    // Add all of the (9,6, or 3 pixels) .rgbtBlue together & divide it by (9,6,3)

    //











    return;
}

/*

void check_middle(int x, int y, RGBTRIPLE image[height][width])
{
    for (int i = 0; i < height - 1; i++)
    {
        for (int k = 0; k < width -1; k++)
        {

        }
    }
}


*/



// void swap(RGBTRIPLE image[height][width])
// {
//     int temp[height][width];
//     int location = 0;

//     for (int i = 0; i < height; i++)
//     {
//         for (int k = width - 1; k >= 0; k--)
//         {
//             temp[i][k] = image[i][k];
//             //temp[i][k].rgbtRed = image[i][k].rgbtRed;
//             //temp[i][k].rgbtGreen = image[i][k].rgbtGreen;
//             //temp[i][k].rgbtBlue = image[i][k].rgbtBlue;

//             image[i][k] = image[i][location];
//             //image[i][k].rgbtRed = image[i][location].rgbtRed;
//             //image[i][k].rgbtGreen = image[i][location].rgbtGreen;
//             //image[i][k].rgbtBlue = image[i][location].rgbtBlue;

//             image[i][location] = temp[i][k];
//             //image[i][location].rgbtRed = temp[i][k].rgbtRed;
//             //image[i][location].rgbtGreen = temp[i][k].rgbtGreen;
//             //image[i][location].rgbtBlue = temp[i][k].rgbtBlue;
//             location ++;
//         }
//         location = 0;
//     }
// }

