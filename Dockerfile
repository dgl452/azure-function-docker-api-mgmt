# To enable ssh & remote debugging on app service change the base image to the one below
# FROM mcr.microsoft.com/azure-functions/python:4-python3.10-appservice
FROM mcr.microsoft.com/azure-functions/python:4-python3.10 as build

ENV AzureWebJobsScriptRoot=/home/site/wwwroot \
    AzureFunctionsJobHost__Logging__Console__IsEnabled=true

ENV AzureWebJobsStorage=$AzureWebJobsStorage
ENV BlobContainerName=$BlobContainerName
ENV BlobOutputContainerName=$BlobOutputContainerName
ENV QueueName=$QueueName

COPY requirements.txt /
RUN pip install -r /requirements.txt

COPY . /home/site/wwwroot

FROM build as authenticator
RUN rm -rf /home/site/wwwroot/finalservice

FROM build as finalservice
RUN rm -rf /home/site/wwwroot/authenticator