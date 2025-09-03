#!/usr/bin/python3
"""docstring"""
import os

# import sys


def this_method() -> str:
    """
        this_method docstring. 
        returns a string
    """
    return "string"


def main() -> None:
    """main function"""
    print("hello")
    print("hello")

    var = 1

    new_var = var + 2
    print(new_var)

    var = 1
    print(var)
    this_method()


if __name__ == "__main__":
    main()
