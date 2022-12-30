import logging
import azure.functions as func
from random import randrange


def main(req: func.HttpRequest) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')

    # ALL THE LOGIC TO VALIDATE THE USER GO HERE
    # WE ARE CREATING A RANDOM TO SIMULTE BAD REQUESTS

    good_token = randrange(2)

    if good_token == 0:
        return func.HttpResponse(
                "the user looks good",
                status_code=200
            )
    else:
        return func.HttpResponse(
                "bad user or password",
                status_code=401
            )

