##################### Normal Starting Project ######################
import datetime as dt
import pandas
import random
import smtplib

MY_EMAIL = "Pintu.Sahoo.260494@gmail.com"
MY_PASSWORD = "Pintu$001"

now = dt.datetime.now()
today_month = now.month
today_day = now.day
today = (today_month, today_day)

data = pandas.read_csv("birthdays.csv")

birthdays_dict = {(data_row.month, data_row.day): data_row for (index, data_row) in data.iterrows()}

if today in birthdays_dict:
    letter_context = []
    with open(f"./letter_templates/letter_{random.randint(1, 3)}.txt") as letter:
        contents = letter.read().replace("[NAME]", birthdays_dict[today]["name"])

    with smtplib.SMTP("smtp.gmail.com", 587) as connection:
        connection.starttls()
        connection.login("Pintu.Sahoo.260494@gmail.com", "Pintu$001")
        connection.sendmail(
            from_addr="Pintu.Sahoo.260494@gmail.com",
            to_addrs=birthdays_dict[today]["email"],
            msg=f"Subject:Happy Birthday\n\n{contents}"
        )
