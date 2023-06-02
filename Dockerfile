FROM rlespinasse/drawio-desktop-headless
COPY run.sh .
ENTRYPOINT [ "bash", "./run.sh" ]