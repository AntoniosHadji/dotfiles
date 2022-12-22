#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# xpath
# /html/body/main/div/a[3]

import os
import re
import subprocess
from getpass import getpass

import requests
from lxml import html

BASE = "https://go.dev"


def get_content(url):
    r = requests.get(BASE + "/dl/")
    tree = html.fromstring(r.content)
    return tree


def find_file(tree):
    # /html/body/main/article/div[1]/a[5]
    for link in tree.xpath("/html/body/main/article/div[1]/a"):
        if "linux" in link.xpath("@href")[0]:
            return link.xpath("@href")[0]


def main():
    tree = get_content(BASE + "/dl/")
    url = find_file(tree)
    print(url)

    fn = url.split("/")[-1]
    if not re.match(r"go1.*linux-amd64.tar.gz", fn):
        print("Filename does not match expected pattern.")
        exit(1)

    r = requests.get(BASE + url, allow_redirects=True)
    open(fn, "wb").write(r.content)

    cmd0 = "sudo rm -rf /usr/local/go".split()
    cmd1 = "sudo tar -C /usr/local -xzf".split()
    cmd1.append(fn)

    pw = getpass("sudo password: ")

    subprocess.run(["go", "version"])

    proc = subprocess.run(cmd0, capture_output=True, input=pw, encoding="ascii")
    print(proc)
    if proc.returncode == 0:
        proc = subprocess.run(cmd1, capture_output=True, input=pw, encoding="ascii")
        print(proc)
        os.remove(fn)

    subprocess.run(["go", "version"])


if __name__ == "__main__":
    main()
