import logging

import azure.functions as func


def main(req: func.HttpRequest) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')

    # ALL THE LOGIC TO VALIDATE THE USER GO HERE

    return func.HttpResponse(
             "the user looks good",
             status_code=200
        )

