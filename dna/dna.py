import csv
import sys


def main():

    # TODO: Check for command-line usage
    if len(sys.argv) != 3:
        sys.exit("Usage: python dna.py FILENAME")

    filename = sys.argv[1]
    seq_filename = sys.argv[2]

    counter = 0
    data = []
    str_sequence = []

    # TODO: Read database file into a variable
    with open(filename, "r") as f:
        reader = csv.reader(f)
        headers = next(reader)

        # Testing Variable
        # print(headers)

        for row in reader:
            # Testing Variable
            # print(row)

            counter += 1

            # Testing Variable
            # print("Counter: ")
            # print(counter)
            data.append(row)

    # TODO: Read DNA sequence file into a variable
    with open(seq_filename, "r") as seq_f:
        #  seq_reader = csv.DictReader(seq_f)
        line = seq_f.readline()

        # Testing Variable
        # print(line)

    # TODO: Find longest match of each STR in DNA sequenceT
    length = len(data[0])
    for i in range(length):
        str_sequence.append(str(longest_match(line, headers[i])))

    str_sequence.pop(0)

    # Testing Variables
    # print("Data: ")
    # print(data)

    # print("Test Data: ")
    # print(test_data)

    # print("Test: ")
    # print(test)

    # print("Length: ")
    # print(len(test[0]))

    # TODO: Check database for matching profiles
    for i in range(counter):
        name_holder = data[i].pop(0)
        if data[i] == str_sequence:
            print(name_holder)
            data[i].insert(0, name_holder)
            sys.exit(0)
        else:
            data[i].insert(0, name_holder)

    print("No Match")

    return


def longest_match(sequence, subsequence):
    """Returns length of longest run of subsequence in sequence."""

    # Initialize variables
    longest_run = 0
    subsequence_length = len(subsequence)
    sequence_length = len(sequence)

    # Check each character in sequence for most consecutive runs of subsequence
    for i in range(sequence_length):

        # Initialize count of consecutive runs
        count = 0

        # Check for a subsequence match in a "substring" (a subset of characters) within sequence
        # If a match, move substring to next potential match in sequence
        # Continue moving substring and checking for matches until out of consecutive matches
        while True:

            # Adjust substring start and end
            start = i + count * subsequence_length
            end = start + subsequence_length

            # If there is a match in the substring
            if sequence[start:end] == subsequence:
                count += 1

            # If there is no match in the substring
            else:
                break

        # Update most consecutive matches found
        longest_run = max(longest_run, count)

    # After checking for runs at each character in seqeuence, return longest run found
    return longest_run


main()

