FROM hashicorp/terraform:1.2.7

WORKDIR /src/terraform

COPY entrypoint.sh ./
COPY init.sh ./
COPY variables ./variables
COPY backend.tf ./
COPY providers.tf ./
COPY local_variables.tf ./
COPY variables.tf ./
COPY main.tf ./

CMD ["plan"]
ENTRYPOINT ["./entrypoint.sh"]
