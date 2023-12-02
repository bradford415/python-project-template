from pytemplate.runner import Runner


def main():
    corpus = "This is the full text that I would like to encode and eventually build a language model of"

    runner = Runner(corpus)
    runner.run()


if __name__ == "__main__":
    main()
