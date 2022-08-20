from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class Shop:

    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def hello_world(self):
        print("Hello World")

    @keyword
    def add_items_to_card_and_checkout(self, productList):

        productsTitles = self.selLib.get_webelements("css:h4[class='card-title']")
        i = 1
        for productsTitle in productsTitles:
            if productsTitle.text in productList:
                self.selLib.click_button(f"(//div[@class='card-footer'])[{str(i)}]/button")
            i += 1
        self.selLib.click_element("css:a[class='nav-link btn btn-primary']")