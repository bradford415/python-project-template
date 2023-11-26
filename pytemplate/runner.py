import numpy as np

from pytemplate.utils.nlp_utils import NLPFunctions


class Runner:
    """Runner class which lays the foundation for executing the code"""

    def __init__(self, corpus):
        """Constructor for the Runner class
        
        Args:
            corpus: body of text to encode/decode
        """
        self.full_text = corpus

    def run(self):
        """Excecute the Runner class
        
        Args:
            text: The text to encode and decode
        """
        # New line for formatting output
        print()

        # Slightly preprocess the original input by converting the string of text to a numpy array of strings
        full_text_array = np.array(self.full_text.split(" "))

        # Instantiate the NLPFunctions class
        nlp = NLPFunctions(full_text_array)

        encoded_sentence = nlp.encode(full_text_array)
        decoded_sentence = nlp.decode(encoded_sentence)

        print(f"Encoded corpus: {encoded_sentence}")
        print(f"Decoded corpus: {decoded_sentence}\n")