import time
import os
import sys

from selenium import webdriver
from selenium.webdriver.firefox.options import Options
from selenium.webdriver.support.ui import Select

# parameters variables
hours = sys.argv[1]
task_description = sys.argv[2]
username = sys.argv[3]
password = sys.argv[4]

# variables
project_name = "IQVIA - IQVIA - ACOE"
assignment_type = "Software Development"
focal_point = "Giovanni Lotti"

def fill_input(browser, xpath, value):
    input = find_by_xpath(browser, xpath)
    input.send_keys(value)

def fill_select(browser, xpath, value):
    select_box = Select(find_by_xpath(browser, xpath))
    select_box.select_by_visible_text(value)

def find_by_xpath(browser, xpath):
    return browser.find_elements_by_xpath(xpath)[0]

def launch_hours():
    print("executing script...")
    option = Options()
    option.headless = False # if headless is true the browser process doesn't appear
    driver = webdriver.Firefox(options=option)
    driver.get("https://timetracker.bairesdev.com")

    # login
    fill_input(driver, "//*[@id='ctl00_ContentPlaceHolder_UserNameTextBox']", str(username))
    fill_input(driver, "//*[@id='ctl00_ContentPlaceHolder_PasswordTextBox']", str(password))
    find_by_xpath(driver, "//*[@id='ctl00_ContentPlaceHolder_LoginButton']").click()

    # fill form of track hours
    find_by_xpath(driver, "/html/body/form/div[3]/div[2]/p[3]/a[1]").click()
    fill_select(driver, "//*[@id='ctl00_ContentPlaceHolder_idProyectoDropDownList']", project_name)
    time.sleep(3)
    fill_input(driver, "//*[@id='ctl00_ContentPlaceHolder_TiempoTextBox']", str(hours))
    fill_select(driver, "//*[@id='ctl00_ContentPlaceHolder_idTipoAsignacionDropDownList']", assignment_type)
    fill_input(driver, "//*[@id='ctl00_ContentPlaceHolder_DescripcionTextBox']", str(task_description))
    fill_select(driver, "//*[@id='ctl00_ContentPlaceHolder_idFocalPointClientDropDownList']", focal_point)
    find_by_xpath(driver, "//*[@id='ctl00_ContentPlaceHolder_btnAceptar']").click()

    # ending
    time.sleep(3)
    driver.quit()

    print("hour succesfully launched!")

if __name__ == "__main__":
    launch_hours()
