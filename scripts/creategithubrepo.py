import time
import os
import sys

from selenium import webdriver
from selenium.webdriver.firefox.options import Options
from selenium.webdriver.support.ui import Select

# variables
custom_url = "http://github.com/login"

# parameters variables
repo_name = sys.argv[1]
username = sys.argv[2]
password = sys.argv[3]

def fill_input(browser, xpath, value):
    input = find_by_xpath(browser, xpath)
    input.send_keys(value)

def find_by_xpath(browser, xpath):
    return browser.find_elements_by_xpath(xpath)[0]

def create_repo():
    print("executing script...")
    option = Options()
    option.headless = True # if headless is true the browser process doesn't appear
    driver = webdriver.Firefox(options=option)
    driver.get(custom_url)

    # login
    fill_input(driver, "//*[@id='login_field']", str(username))
    fill_input(driver, "//*[@id='password']", str(password))
    find_by_xpath(driver, "/html/body/div[3]/main/div/form/div[4]/input[9]").click()

    # create new repo
    find_by_xpath(driver, "/html/body/div[4]/div/aside[1]/div[2]/div[2]/div/h2/a").click()
    fill_input(driver, "//*[@id='repository_name']", str(repo_name))
    time.sleep(3)
    driver.find_elements_by_css_selector("button.btn:nth-child(10)")[0].submit()
    time.sleep(3)
    driver.quit()

if __name__ == "__main__":
    create_repo()
