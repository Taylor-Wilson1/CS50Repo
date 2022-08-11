#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <cs50.h>

// Close any remaining files

int main(int argc, char *argv[])
{
    // Check for invalid usage
    if (argc < 2)
    {
        printf("Usage: ./recover\n");
        return 1;
    }

    FILE *file = fopen(argv[1], "r");
    uint8_t buffer[512];
    int counter = 0;
    char *filename = malloc(512);
    FILE *img = NULL;

    while (fread(buffer, 1, 512, file) == 512)
    {
        if (buffer[0] == 0xff && buffer[1] == 0xd8 && buffer[2] == 0xff && (buffer[3] & 0xf0) == 0xe0)
        {
            sprintf(filename, "%03i.jpg", counter);
            img = fopen(filename, "w");
            //fwrite(buffer, 1, 512, img);
            counter++;
        }

        if (img != NULL)
        {
            fwrite(buffer, 1, 512, img);
        }
    }
    fclose(img);
    fclose(file);
    free(filename);
    return 0;
}