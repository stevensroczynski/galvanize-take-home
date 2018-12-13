import argparse
from collections import Counter
import re

parser = argparse.ArgumentParser(description='Take some input')
parser.add_argument('-i', type=str, help='Input File Path')
parser.add_argument('-v', action='store_true', help='Verbose (Extra Credit)')

def main(args):
    if(args.i):
        inputFile = readFile(args.i)
        processFile(inputFile, args)

def readFile(inputFilePath):
    return open(inputFilePath, "r").read()

def processFile(inputFile, args):
    totals = {}
    totals['word_count'] = countWords(inputFile)
    totals['unique_word_count'] = countUniqueWords(inputFile)
    totals['sentence_count'] = countSentences(inputFile)
    totals['average_sentence_length'] = averageSentenceLength(totals['sentence_count'], totals['word_count'])
    totals['unique_phrases'] = countRepeatedPhrases(inputFile)
    totals['ordered_list_unique_words'] = listUniqueWords(inputFile)
    displayData(totals, args)

def countSentences(inputFile):
    return inputFile.count(".") + inputFile.count("?") + inputFile.count("!")

def countWords(inputFile):
    return len(inputFile.split(' '))

def countUniqueWords(inputFile):
    return len(Counter(inputFile.lower().split()).keys())

def listUniqueWords(inputFile):
    output = []
    temp = inputFile.lower()
    temp = re.sub(r'[^\w]', ' ', temp)
    temp = re.sub('[\r\n]','', temp)
    count_object = Counter(temp.strip().split())
    output = [i[0] for i in count_object.most_common()]
    return output

def averageSentenceLength(numSentences, numWords):
    return numWords / numSentences

def countRepeatedPhrases(inputFile):
    output = []
    temp = inputFile.lower()
    temp = re.sub(r'[^\w]', ' ', temp)
    temp = re.sub('[\r\n]','', temp)
    temp_list = temp.strip().split()

    for i in range(len(temp_list) - 3):
        phrase = str(temp_list[i] + " " + temp_list[i + 1] + " " + temp_list[i + 2])
        num = temp.count(phrase)
        if num > 3 :
            output.append({"phrase": phrase, "occurances": num})

    output = [i for n, i in enumerate(output) if i not in output[n + 1:]]
    return output

def displayData(data, args):
    print("Word Count: ", data['word_count'])
    print("Unique Word Count: ", data['unique_word_count'])
    print("Sentence Count: ", data['sentence_count'])

    if args.v:
        print("Average Sentence Length: {} words".format(data['average_sentence_length']))
        print("Unique Phrases:")
        for phrase in data['unique_phrases']:
            print("The phrase: \"{}\" appears {} times in the document.".format(phrase['phrase'], phrase['occurances']))
        print("A list of words that apear in the document, in order of frequency:")
        for word in data['ordered_list_unique_words']:
            print(word)

if __name__ == '__main__':
    args = parser.parse_args()
    main(args)
