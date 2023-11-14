FROM alpine

RUN apk -U --no-progress upgrade  \
        && apk -U --no-progress add taskd taskd-pki
COPY run.sh /app/taskd/run.sh

ARG TASKDDATA
ENV TASKDDATA ${TASKDDATA:-/var/taskd}

VOLUME ["${TASKDDATA}"]
EXPOSE 53589
ENTRYPOINT ["/app/taskd/run.sh"]
