#!/usr/bin/env  python3

import argparse
import time
import os


def simplePrint(variableName: str, interval: int) -> None:
    while True:
        try:
            print(os.environ[variableName])
            time.sleep(interval)
        except KeyError:
            print(f"Environment variable {variableName} is not set")
            print("Exiting...")
            return


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        prog='simple_programing_service.py',
        description='This program is printing an environment variable that is optionally specified at optionally specified intervals',
    )

    defaultVariableName = "DEFAULT"
    defaultInterval = 10
    parser.add_argument('-n', '--variableName', default=defaultVariableName)
    parser.add_argument('-i', '--interval', type=int, default=5)

    args = parser.parse_args()
    simplePrint(args.variableName, args.interval)