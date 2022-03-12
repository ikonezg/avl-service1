FROM python:2.7-slim

RUN apt update -y && apt install -y curl && curl -sL https://github.com/openfaas/faas/releases/download/0.9.14/fwatchdog > /usr/bin/fwatchdog \
    && chmod +x /usr/bin/fwatchdog

ENV fprocess="python2 entrypoint.py"
RUN useradd --create-home appuser
USER appuser

WORKDIR /home/appuser

COPY entrypoint.py /

EXPOSE 8080
CMD [ "fwatchdog" ]