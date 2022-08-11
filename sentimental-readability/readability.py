from cs50 import get_string

def main():
    text =input("Provide Text: ")

    letters = count_letters(text)
    words = count_words(text)
    sentences = count_sentences(text)
    grade_lvl = calc_grade_lvl(letters, words, sentences)

    if grade_lvl < 1:
        print("Before Grade 1")
    elif grade_lvl > 16:
        print("Grade 16+")
    else:
        print(f"Grade {grade_lvl}")

    print(letters)
    print(words)
    print(sentences)
    print(grade_lvl)

def count_letters(text):
    counter = 0
    punct = 0

    for i in range(len(text)):
        if text[i].islower() or text[i].isupper:
            counter += 1

    for j in range(len(text)):
        if text[j] in ("!","?",".",",", " ", "'"):
            punct += 1

    return counter - punct

def count_words(text):
    counter = 0

    for i in range(len(text)):
        if text[i] == " ":
            counter += 1

    return counter + 1


def count_sentences(text):
    counter = 0

    for i in range(len(text)):
        if (((text[i]) == '?') or ((text[i]) == '!') or ((text[i]) == '.')):
            counter += 1

    return counter


def calc_grade_lvl(letters, words, sentences):
    L = (letters / words) * 100
    S = (sentences / words) * 100
    first_part = 0.0588 * L
    second_part = 0.296 * S
    combine = first_part - second_part
    index = round(combine - 15.8)

    return (index)


if __name__ == "__main__":
    main()