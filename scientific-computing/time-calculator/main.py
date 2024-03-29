def add_time(start, duration, starting_day=None):
    days = {
        "monday": 1,
        "tuesday": 2,
        "wednesday": 3,
        "thursday": 4,
        "friday": 5,
        "saturday": 6,
        "sunday": 7,
    }
    duration = duration.rsplit(":")
    start = start.rsplit(":")
    minutes_and_period = start[1].rsplit(" ")

    if minutes_and_period[1] == "PM":
        time_in_minutes = (int(start[0]) + 12) * 60 + int(minutes_and_period[0])

    else:
        time_in_minutes = int(start[0]) * 60 + int(minutes_and_period[0])

    total_time_in_minutes = time_in_minutes + int(duration[0]) * 60 + int(duration[1])
    days_after = int(total_time_in_minutes / (60 * 24))
    days_later = days_after

    final_h = int(((((time_in_minutes + int(duration[0]) * 60 + int(duration[1])) / 1440) % 1) * 24) // 1)
    final_m = round((((((time_in_minutes + int(duration[0]) * 60 + int(duration[1])) / 1440) % 1) * 24) % 1) * 60)

    final_period = ""
    if final_h < 12:
        final_period = "AM"

        if final_h == 0:
            final_h = 12

    elif final_h == 12:
        final_period = "PM"

    else:
        final_h = final_h - 12
        final_period = "PM"

    if final_m < 10:
        final_m = "0" + str(final_m)

    if starting_day is not None:

        print(days_later, days_after)

        day = days.get(starting_day.lower())

        if days_after != 0:
            days_after += day

            while days_after > 7:
                days_after -= 7

            day_index = [key for key, value in days.items() if value == days_after][0].capitalize()

        else:
            day_index = starting_day

        if days_later == 1:
            final_time = f"{str(final_h)}:{str(final_m)} {final_period}, {day_index} (next day)"

        elif days_later == 0:
            final_time = f"{str(final_h)}:{str(final_m)} {final_period}, {day_index}"

        else:
            final_time = f"{str(final_h)}:{str(final_m)} {final_period}, {day_index} ({days_later} days later)"

    else:
        if days_later == 1:
            final_time = f"{str(final_h)}:{str(final_m)} {final_period} (next day)"

        elif days_later == 0:
            final_time = f"{str(final_h)}:{str(final_m)} {final_period}"

        else:
            final_time = f"{str(final_h)}:{str(final_m)} {final_period} ({days_later} days later)"

    return final_time
