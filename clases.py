import time
import unittest

from selenium import webdriver

class SomeTests(unittest.TestCase):
    def test_just_test(self):
        home = "/Users/adamsiudy/development/robot-scripts/demo/drivers/chromedriver"

        driver = webdriver.Chrome(home)  # Optional argument, if not specified will search path.
        driver.get("http://www.google.com")
        time.sleep(5) # Let the user actually see something!
        search_box = driver.find_element_by_name('q')
if __name__ == "__main__":
   unittest.main()