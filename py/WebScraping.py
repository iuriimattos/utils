import os
import sys
import time
import traceback

from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager


def connectChrome():
    print("[*] Connected to opened Chrome")
    options = Options()
    options.add_experimental_option("debuggerAddress", "127.0.0.1:9222")
    return webdriver.Chrome(ChromeDriverManager().install(),
                            options=options)


def findData(driver):
    raise NotImplementedError("work in progress")


def startSheet(driver):
    if os.path.isfile(sys.argv[2]):
        with open(sys.argv[2], "r", encoding="utf-8") as file:
            doSheet(file, findData(driver), mode="a")
    else:
        with open(sys.argv[2], "w", encoding="utf-8") as file:
            doSheet(file, findData(driver), mode="w")


def doSheet(csvFile, data, mode):
    raise NotImplementedError("work in progress")


def printSheet(newList, list, csvWorker):
    raise NotImplementedError("work in progress")


if __name__ == '__main__':
    try:
        driver = connectChrome()
        driver.refresh()
        time.sleep(int(sys.argv[1]))
        startSheet(driver)
    except Exception as e:
        print("[*] Error! Logs:")
        print(e)
        traceback.print_exc()
        sys.exit()
