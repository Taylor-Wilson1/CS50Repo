#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#define HEIGHT 1
#define WIDTH 4

// typedef uint8_t  BYTE;
// typedef struct
// {
//     BYTE  rgbtBlue;
//     BYTE  rgbtGreen;
//     BYTE  rgbtRed;
// } __attribute__((__packed__))
// RGBTRIPLE;



//void reflect(int height, int width, RGBTRIPLE image[height][width]);

//{{0, 1, 2, 3, 4}, {5, 6, 7, 8, 9}};
void swap(int array[HEIGHT][WIDTH]);

int main (void)
{
    int image[HEIGHT][WIDTH] = {{0,1,2,3}};
    //{{0,1,2}, {3,4,5}}; 2 3
    //{{0,1,2}}; 1 3
    //{{0,1,2,3,4}, {5,6,7,8,9}}; 2 5
    //{{0,1,2,3}}; 1 4


    for (int i = 0; i < HEIGHT; i++)
    {
        for (int k = 0; k < WIDTH; k++)
        {
            //image[i][k] = image[i][k];

            //scanf("%d", &image[i][k]);
            printf("%d",image[i][k]);


        }
        printf("\n");
    }

    swap(image);
    for (int i = 0; i < HEIGHT; i++)
    {
        for (int k = WIDTH - 1; k >= 0; k--)
        {
            //image[i][k] = image[i][k];

            //scanf("%d", &image[i][k]);
            printf("%d",image[i][k]);

        }
        printf("\n");
    }

    return 0;
}

void swap(int array[HEIGHT][WIDTH])
{
    int temp[HEIGHT][WIDTH];
    int location = 0;

    for (int i = 0; i < HEIGHT; i++)
    {
        for (int k = WIDTH - 1; k >= 0; k--)
        {
            temp[i][k] = array[i][k];
            array[i][k] = array[i][location];
            array[i][location] = temp[i][k];
            location ++;
        }
        location = 0;
    }
}


// void reflect(int height, int width, int image[height][width])
// {
//     // For every row, swap pixels on opposite sides

//     RGBTRIPLE temp[height][width];
//     int location;

//     for (int i = 0; i < height; i++)
//     {
//         for (int k = width - 1; k >= 0; k--)
//         {
//             location = 0;
//             // if (k == width / 2)
//             // {
//             //     temp[i][k].rgbtRed = image[i][k].rgbtRed;
//             //     temp[i][k].rgbtGreen = image[i][k].rgbtGreen;
//             //     temp[i][k].rgbtBlue = image[i][k].rgbtBlue;

//             //     image[i][k].rgbtRed = image[i][location].rgbtRed;
//             //     image[i][k].rgbtGreen = image[i][location].rgbtGreen;
//             //     image[i][k].rgbtBlue = image[i][location].rgbtBlue;

//             //     image[i][location].rgbtRed = temp[i][k].rgbtRed;
//             //     image[i][location].rgbtGreen = temp[i][k].rgbtGreen;
//             //     image[i][location].rgbtBlue = temp[i][k].rgbtBlue;

//             //     return;
//             // }

//             temp[i][k].rgbtRed = image[i][k].rgbtRed;
//             temp[i][k].rgbtGreen = image[i][k].rgbtGreen;
//             temp[i][k].rgbtBlue = image[i][k].rgbtBlue;

//             image[i][k].rgbtRed = image[i][location].rgbtRed;
//             image[i][k].rgbtGreen = image[i][location].rgbtGreen;
//             image[i][k].rgbtBlue = image[i][location].rgbtBlue;

//             image[i][location].rgbtRed = temp[i][k].rgbtRed;
//             image[i][location].rgbtGreen = temp[i][k].rgbtGreen;
//             image[i][location].rgbtBlue = temp[i][k].rgbtBlue;
//             location ++;
//         }
//     }
//     return;
// }




// location = 0;
            // if (k >= width / 2)
            // {
            //     temp[i][k].rgbtRed = image[i][k].rgbtRed;
            //     temp[i][k].rgbtGreen = image[i][k].rgbtGreen;
            //     temp[i][k].rgbtBlue = image[i][k].rgbtBlue;

            //     image[i][k].rgbtRed = image[i][location].rgbtRed;
            //     image[i][k].rgbtGreen = image[i][location].rgbtGreen;
            //     image[i][k].rgbtBlue = image[i][location].rgbtBlue;

            //     image[i][location].rgbtRed = temp[i][k].rgbtRed;
            //     image[i][location].rgbtGreen = temp[i][k].rgbtGreen;
            //     image[i][location].rgbtBlue = temp[i][k].rgbtBlue;
            //return
            //}