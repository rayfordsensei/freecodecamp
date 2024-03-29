import math


def digit_count(number):  # https://stackoverflow.com/questions/2189800
    if number > 0:
        digits = int(math.log10(number)) + 1
    elif number == 0:
        digits = 1
    else:
        digits = int(math.log10(-number)) + 2
    return digits


class Category:
    def __init__(self, name):
        self.ledger = []
        self.balance = 0
        self.deficit = 0
        self.name = name

    def __str__(self):
        title_spacing = "*" * ((30 - len(self.name)) // 2)
        output = f"{title_spacing}{self.name}{title_spacing}\n"
        for i in range(len(self.ledger)):
            if digit_count(self.ledger[i]["amount"]) > 4:
                spacing = " " * (30 - len(self.ledger[i]["description"][:23]) - digit_count(self.ledger[i]["amount"]))
                output += f"{self.ledger[i]['description'][:23]}{spacing}{int(self.ledger[i]['amount'])}\n"
            else:
                spacing = " " * (
                    30 - len(self.ledger[i]["description"][:23]) - digit_count(self.ledger[i]["amount"]) - 3
                )
                output += f"{self.ledger[i]['description'][:23]}{spacing}{self.ledger[i]['amount']:.2f}\n"

        return f"{output}Total: {self.balance:.2f}"

    def deposit(self, amount, description=""):
        self.balance += amount
        self.ledger.append({"amount": amount, "description": description})

    def withdraw(self, amount, description=""):
        if self.check_funds(amount):
            self.balance -= amount
            self.ledger.append({"amount": amount * -1, "description": description})
            self.deficit += amount
            return True
        else:
            return False

    def get_balance(self):
        return self.balance

    def transfer(self, amount, budget_category):
        if self.check_funds(amount):
            self.withdraw(amount, f"Transfer to {budget_category.name}")
            budget_category.deposit(amount, f"Transfer from {self.name}")
            return True
        else:
            return False

    def check_funds(self, amount):
        return self.balance - amount >= 0


def create_spend_chart(categories):
    bar_chart = "Percentage spent by category\n"
    total_spent = 0
    spent = []
    for category in categories:
        total_spent += category.deficit
    for category in categories:
        if math.floor((category.deficit / total_spent) * 10) == 0 and category.deficit != 0:
            spent.append(0)
        elif category.deficit != 0:
            spent.append(math.floor((category.deficit / total_spent) * 10) * 10)
        elif category.deficit == 0:
            spent.append(0)
    for i in range(11):
        if i == 0:
            bar_chart += "100|"
            for j in range(len(categories)):
                if spent[j] == 100:
                    bar_chart += " o"
                    if j + 1 <= len(categories) - 1 and spent[j + 1] == 100:
                        bar_chart += " "
                else:
                    bar_chart += "   "
                if j == len(categories) - 1:
                    bar_chart += " \n"
        if i > 0 and i < 10:
            bar_chart += f" {100 - i * 10}|"
            for j in range(len(categories)):
                if spent[j] >= 100 - i * 10:
                    bar_chart += " o"
                    bar_chart += " "
                else:
                    bar_chart += "   "
                if j == len(categories) - 1:
                    bar_chart += " \n"
        if i == 10:
            bar_chart += "  0|"
            for j in range(len(categories)):
                bar_chart += " o"
                if j + 1 <= len(categories) - 1 and spent[j + 1] >= 100 - i * 10:
                    bar_chart += " "
                if j == len(categories) - 1:
                    bar_chart += "  \n"
    bar_chart += "    " + "-" * 3 * len(categories) + "-\n"
    for i in range(len(categories)):
        longest_name = categories[0].name
        if len(categories[i].name) > len(longest_name):
            longest_name = categories[i].name
    for i in range(len(longest_name)):
        bar_chart += "    "
        for j in range(len(categories)):
            if i > len(categories[j].name) - 1:
                bar_chart += "   "
            else:
                if j == len(categories) - 1 and i == len(categories[j].name) - 1:
                    bar_chart += f" {categories[j].name[i]}"
                else:
                    bar_chart += f" {categories[j].name[i]} "
            if j == len(categories) - 1 and i != len(longest_name) - 1:
                bar_chart += " \n"
    bar_chart += "  "
    return bar_chart


food = Category("Food")
entertainment = Category("Entertainment")
business = Category("Business")
food.deposit(900, "deposit")
entertainment.deposit(900, "deposit")
business.deposit(900, "deposit")

food.withdraw(105.55)
entertainment.withdraw(33.40)
business.withdraw(10.99)

print(create_spend_chart([business, food, entertainment]))
print(repr(create_spend_chart([business, food, entertainment])))
