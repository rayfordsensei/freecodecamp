class Rectangle:
    def __init__(self, width, height):
        self.width = width
        self.height = height

    def __str__(self):
        return f"Rectangle(width={self.width}, height={self.height})"

    def set_width(self, number):
        self.width = number

    def set_height(self, number):
        self.height = number

    def get_area(self):
        return self.width * self.height

    def get_perimeter(self):
        return 2 * (self.width + self.height)

    def get_diagonal(self):
        return (self.width**2 + self.height**2) ** 0.5

    def get_picture(self):
        if self.width > 50 or self.height > 50:
            return "Too big for picture."
        picture = ""
        for _ in range(self.height):
            picture += "*" * self.width + "\n"
        return picture

    def get_amount_inside(self, figure):
        if self.width < figure.width or self.height < figure.height:
            return 0
        return int((self.width / figure.width) * (self.height / figure.height))


class Square(Rectangle):
    def __init__(self, side):
        self.height = side
        self.width = side

    def __str__(self):
        return f"Square(side={self.height})"

    def set_side(self, number):
        self.height = number
        self.width = number

    def set_width(self, number):
        self.height = number
        self.width = number

    def set_height(self, number):
        self.height = number
        self.width = number


rect = Rectangle(10, 5)
print(rect.get_area())
rect.set_height(3)
print(rect.get_perimeter())
print(rect)
print(rect.get_picture())

sq = Square(9)
print(sq.get_area())
sq.set_side(4)
print(sq.get_diagonal())
print(sq)
print(sq.get_picture())

rect.set_height(8)
rect.set_width(16)
print(rect.get_amount_inside(sq))

print(Rectangle(15, 10).get_amount_inside(Square(5)))
print(Rectangle(4, 8).get_amount_inside(Rectangle(3, 6)))
print(Rectangle(2, 3).get_amount_inside(Rectangle(3, 6)))
