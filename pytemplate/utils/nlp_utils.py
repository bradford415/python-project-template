from typing import Dict, Tuple

import numpy as np


class NLPFunctions():
    """Class which stores and controls natural language processing functions (NLP)"""

    def __init__(self, full_text: np.ndarray) -> None:
        """Constructor for the NLPFunctions class
        
        Args:
            full_text: A list of words of the entire body of text to encode/decode
        """
        self.full_text = full_text # Converted to a list of words
        
        # A list of all unique words (vocab) in the full_text
        self.vocab = sorted(list(set(full_text)))
        self.word_to_integer = self._create_vocab_mapping()
        self.integer_to_word = self._create_vocab_mapping(reverse=True)
        self._display_information()

    def _create_vocab_mapping(self, reverse: bool = False) -> Tuple[Dict[str, int], Dict[int, str]]:
        """Create the vocabulary (unique characters) of the full text by encoding unique
        words as integers.
        
        Args:
            reverse: Whether to reverse the dictionary mapping
        """

        if not reverse:
            return {word: index for index, word in enumerate(self.vocab)}
        else:
            return {index: word for index, word in enumerate(self.vocab)}
        
    def _display_information(self):
        print(f"Corpus: {self.full_text}")
        print(f"Vocabulary of corpus: {self.vocab}")
        print(f"Length of vocabulary: {len(self.vocab)}")


    def encode(self, sentence: np.ndarray) -> np.ndarray:
        """Encoded a sentence to integers using the word_to_integer dict

        Args:
            sentence: A list of strings/words forming a sentence 
        """
        return [self.word_to_integer[word] for word in sentence]
    
    def decode(self, encoded_sentence: np.ndarray) -> np.ndarray:
        """Decode an encoded sentence of integers

        Args:
            encoded_sentence: An encoded sentence encoded with the word_to_integer mapping 
        """
        return [self.integer_to_word[encoded_word] for encoded_word in encoded_sentence]
