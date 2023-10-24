#!/usr/bin/env  python3

import argparse
import time
import os

parser = argparse.ArgumentParser(
    prog='SimpleService',
    description='This program is printing an environment variable that is optionally specified',
)

defaultVariableName = "DEFAULT"
defaultInterval = 10
parser.add_argument('-n', '--variableName', default=defaultVariableName)
parser.add_argument('-i', '--interval', default=10)


args = parser.parse_args()

while True:
    try:
        print(os.environ[args.variableName])
        time.sleep(args.interval)
    except KeyError:
        print(f"Environment variable {args.variableName} is not set")
        print("Exiting...")
        break
    