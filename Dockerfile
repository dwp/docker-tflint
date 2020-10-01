FROM alpine:3.11.3

RUN apk --no-cache add bash jq curl ca-certificates

RUN curl -Lk "https://github.com/terraform-linters/tflint/releases/download/v0.20.2/tflint_linux_amd64.zip" -o tflint.zip \
    && unzip tflint.zip && rm tflint.zip \
    && install tflint /usr/local/bin

RUN tflint -v 

CMD ["/bin/bash"]
