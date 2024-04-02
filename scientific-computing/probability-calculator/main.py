import copy
import random
import collections


class Hat:
    def __init__(self, **balls):
        self.balls = balls
        self.contents = []
        for key, value in balls.items():
            for _ in range(value):
                self.contents.append(key)

    def draw(self, number):
        if number > len(self.contents):
            number = len(self.contents)
        drawn = []
        remaining = copy.copy(self.contents)
        sample = random.sample(remaining, number)
        for i in range(len(sample)):
            remaining.remove(sample[i])
        drawn.append(sample)
        return sample


def experiment(hat, expected_balls, num_balls_drawn, num_experiments):
    match = 0
    for _ in range(0, num_experiments):
        drawn = hat.draw(num_balls_drawn)
        expect = []
        for key, value in expected_balls.items():
            for _ in range(0, value):
                expect.append(key)
        if not collections.Counter(expect) - collections.Counter(
            drawn
        ):  # https://stackoverflow.com/questions/10176037
            match += 1
        drawn.clear()
    return round(match / num_experiments, 3)


hat1 = Hat(yellow=3, blue=2, green=6)
hat2 = Hat(red=5, orange=4)
hat3 = Hat(red=5, orange=4, black=1, blue=0, pink=2, striped=9)

print(hat1.contents)
print(hat1.draw(2))
print(hat1.contents)

hat = Hat(black=6, red=4, green=3)
probability = experiment(hat=hat, expected_balls={"red": 2, "green": 1}, num_balls_drawn=5, num_experiments=2000)
print(probability)
