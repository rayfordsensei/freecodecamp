import re
import numexpr


def arithmetic_arranger(problems, show_answers=False):
    if len(problems) > 5:
        return "Error: Too many problems."
    answers = []
    upper_string = ""
    lower_string = ""
    dash_string = ""
    answer_string = ""
    final_string = ""
    for index in range(len(problems)):
        txt = problems[index]
        wrong_operator = r"[*/]"

        if re.search(wrong_operator, txt) is not None:
            return "Error: Operator must be '+' or '-'."

        number_pattern = r".+?(?=[+-])"
        left_part = 0
        right_part = 0
        operator = ""
        dash_element = ""
        upper_spacing = ""
        lower_spacing = ""
        answer_spacing = ""
        problem_spacing = "    "
        formatted_txt = txt.replace(" ", "")

        left_part = re.search(number_pattern, formatted_txt).group()  # type: ignore # for simplicity
        operator = formatted_txt[len(left_part) : len(left_part) + 1]
        right_part = formatted_txt[len(left_part) + 1 :]

        if re.search(r"\D", left_part) is not None or re.search(r"\D", right_part) is not None:
            return "Error: Numbers must only contain digits."

        if len(left_part) > 4 or len(right_part) > 4:
            return "Error: Numbers cannot be more than four digits."

        if len(left_part) > len(right_part):
            for _ in range(len(left_part) + 2):
                dash_element += "-"
        else:
            for _ in range(len(right_part) + 2):
                dash_element += "-"
        for _ in range(len(dash_element) - len(left_part)):
            upper_spacing += " "
        for _ in range(len(dash_element) - len(right_part) - 1):
            lower_spacing += " "
        upper = upper_spacing + left_part
        lower = operator + lower_spacing + right_part

        answer = numexpr.evaluate(txt)
        for _ in range(len(upper) - len(str(answer))):
            answer_spacing += " "
        answer_part = answer_spacing + str(answer)

        if index == len(problems) - 1:
            upper_string += upper + "\n"
            lower_string += lower + "\n"
            if show_answers:
                dash_string += dash_element + "\n"
                answer_string += answer_part
            else:
                dash_string += dash_element
        else:
            upper_string += upper + problem_spacing
            lower_string += lower + problem_spacing
            dash_string += dash_element + problem_spacing
            answer_string += answer_part + problem_spacing

    if show_answers:
        final_string += upper_string + lower_string + dash_string + answer_string
    else:
        final_string += upper_string + lower_string + dash_string
    answers.append(final_string)
    return answers[0]


print(arithmetic_arranger(["3801 - 2", "123 + 49"]), "\n")
print(arithmetic_arranger(["3 + 855", "3801 - 2", "45 + 43", "123 + 49"]), "\n")
print(arithmetic_arranger(["11 + 4", "3801 - 2999", "1 + 2", "123 + 49", "1 - 9380"]), "\n")
print(arithmetic_arranger(["44 + 815", "909 - 2", "45 + 43", "123 + 49", "888 + 40", "653 + 87"]), "\n")
print(arithmetic_arranger(["3 / 855", "3801 - 2", "45 + 43", "123 + 49"]), "\n")
print(arithmetic_arranger(["24 + 85215", "3801 - 2", "45 + 43", "123 + 49"]), "\n")
print(arithmetic_arranger(["98 + 3g5", "3801 - 2", "45 + 43", "123 + 49"]), "\n")
print(arithmetic_arranger(["3 + 855", "988 + 40"], True), "\n")
print(arithmetic_arranger(["32 - 698", "1 - 3801", "45 + 43", "123 + 49", "988 + 40"], True), "\n")
