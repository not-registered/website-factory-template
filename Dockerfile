FROM busybox:1.37

ARG PROJECT_MARKER=GOKON-WEBSITE_FACTORY_TEMPLATE-STAGING-OK

COPY index.html /www/index.html

RUN test -n "${PROJECT_MARKER}" \
 && grep -Fq '__FACTORY_MARKER__' /www/index.html \
 && sed -i "s/__FACTORY_MARKER__/${PROJECT_MARKER}/g" /www/index.html \
 && grep -Fq "${PROJECT_MARKER}" /www/index.html

USER 65534:65534
EXPOSE 8080
CMD ["httpd", "-f", "-p", "8080", "-h", "/www"]
