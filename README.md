## Purpose

The Sample Hub is a [Jekyll](https://jekyllrb.com)-based static site. Add your content under docs, link them in navigation and deploy on K8.

## Local Development

Requirements:
- Ruby 2.0+
- Jekyll and Bundler gems

```sh
gem install jekyll bundler
bundle install
bundle exec jekyll serve
```

## Deployment
The website is deployed on K8. Use the Makefile commands.
```
hub-website compile              Compiles the site
hub-website run                  Runs locally
hub-website docker/build         Build and tag the Docker image. vars:tag
hub-website docker/push          Push the Docker image to ECR. vars:tag
hub-website install              Deploy the site on kubernetes
hub-website delete               Delete the job stack from kubernetes.
hub-website help                 This helps
```

## editing

I am using the [minimal-mistakes](https://github.com/mmistakes/minimal-mistakes) Jekyll theme. It's packed with layout options and utilities. Check out the [quickstart guide](https://mmistakes.github.io/minimal-mistakes/docs/quick-start-guide/) and the guide's [source code](https://github.com/mmistakes/minimal-mistakes/blob/master/docs/_docs) to learn to use the theme.
