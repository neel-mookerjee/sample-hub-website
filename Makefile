AWS_ACCOUNT	:= "123456789012"
IMAGE_NAME	:= "hub-website"
REPOSITORY_NAME	:= "$(IMAGE_NAME)"
ECR_REPOSITORY	:= "$(AWS_ACCOUNT).dkr.ecr.us-west-2.amazonaws.com/$(REPOSITORY_NAME)"

check-var = $(if $(strip $($1)),,$(error var for "$1" is empty))

default: help

require_tag:
	$(call check-var,tag)

compile:			## Compiles the site
					@bundle exec jekyll build

run:				## Runs locally
					@bundle exec jekyll serve

docker/build:		validate_tag ## Build and tag the Docker image. vars:tag
					@docker build -t $(IMAGE_NAME) -f ./LocalDockerFile .
					@docker tag $(REPOSITORY_NAME) $(ECR_REPOSITORY):$(tag)

validate_tag:		require_tag

docker/push:		validate_tag ## Push the Docker image to ECR. vars:tag
					@aws ecr get-login --region us-west-2 --no-include-email | sh -
					@docker push $(ECR_REPOSITORY):$(tag)

install:			## Deploy the site on kubernetes
					@kubectl apply -f ./kubernetes/

delete:				## Delete the job stack from kubernetes.
					@kubectl delete -f ./kubernetes/

help:				## This helps
					@awk 'BEGIN {FS = ":.*?## "} /^[\/a-zA-Z_-]+:.*?## / {sub("\\\\n",sprintf("\n%22c"," "), $$2);printf "\033[36mhub-website \033[0m%-20s %s\n", $$1, $$2}' $(MAKEFILE_LIST)
